# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: nanoc-bibtex 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc-bibtex"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ruben Verborgh"]
  s.date = "2015-12-29"
  s.description = "BibTeX data source for nanoc."
  s.email = "ruben@verborgh.org"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/nanoc/data_sources/bibtex_data_source.rb",
    "nanoc-bibtex.gemspec"
  ]
  s.homepage = "http://github.com/RubenVerborgh/nanoc-bibtex"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "BibTeX data source for nanoc."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nanoc>, ["~> 4.0"])
      s.add_runtime_dependency(%q<bibtex-ruby>, ["~> 4.1"])
      s.add_runtime_dependency(%q<latex-decode>, ["~> 0.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
    else
      s.add_dependency(%q<nanoc>, ["~> 4.0"])
      s.add_dependency(%q<bibtex-ruby>, ["~> 4.1"])
      s.add_dependency(%q<latex-decode>, ["~> 0.2"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<nanoc>, ["~> 4.0"])
    s.add_dependency(%q<bibtex-ruby>, ["~> 4.1"])
    s.add_dependency(%q<latex-decode>, ["~> 0.2"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
  end
end

