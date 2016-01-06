require 'bibtex'

class BibtexDataSource < Nanoc::DataSource
  identifier :bibtex

  def up
    @files = Dir[@config[:path].sub(/\/?$/, '/*.bib')];
    @exclude = {}
    (@config[:exclude] || []).each { |value| @exclude[value] = true }
  end

  def items
    @files.map do |file|
      stat = File.stat file
      file_checksum = stat.size.to_s + '-' + stat.mtime.to_i.to_s
      entries = BibTeX.open(file)
      entries.map do |entry|
        new_item lambda { to_bibtex entry }, lambda { extract_attributes entry },
                 '/' + entry.key, checksum_data: file_checksum
      end
    end.flatten!
  end

  def to_bibtex entry
    contents = ["@#{entry.type}{#{entry.key},"]
    entry.each do |key, value|
      unless @exclude[key.to_s]
        if value =~ /^\d+$/ or (key == :month and value =~ /^[a-z]{1,3}$/)
          contents.push "  #{key} = #{value},"
        else
          contents.push "  #{key} = {#{value}},"
        end
      end
    end
    contents.push "}"
    contents.join "\n"
  end

  def extract_attributes entry
    entry = entry.convert(:latex) { |key| key != :url }
    attributes = {
      :bibtex => entry,
      :key    => entry.key,
      :type   => entry.type,
    }
    entry.each { |key, value| attributes[key] = value }
    attributes
  end
end
