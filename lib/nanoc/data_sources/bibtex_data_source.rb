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
      entries = BibTeX.open(file)
      entries.map do |entry|
        new_item to_bibtex(entry), extract_attributes(entry), "/#{entry.key}"
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
    entry = entry.convert :latex
    attributes = {
      :bibtex => entry,
      :key    => entry.key,
      :type   => entry.type,
    }
    entry.each { |key, value| attributes[key] = value }
    attributes
  end
end
