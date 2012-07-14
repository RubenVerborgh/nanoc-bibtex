require 'bibtex'

class BibtexDataSource < Nanoc3::DataSource
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
        Nanoc3::Item.new to_bibtex(entry), extract_attributes(entry), entry.key
      end
    end.flatten!
  end

  def to_bibtex entry
    contents = [ "@#{entry.type}{#{entry.key}," ]
    entry.each do |key, value|
      unless @exclude[key.to_s]
        unless value =~ /\s|\{|\}|"|,|:|-/
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
    attributes = { :key => entry.key }
    entry.each { |key, value| attributes[key] = value.convert(:latex) }
    attributes
  end
end
