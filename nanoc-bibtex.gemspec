# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'nanoc-bibtex'
  s.version     = '0.0.2'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ruben Verborgh']
  s.email       = ['ruben.verborgh@gmail.com']
  s.homepage    = 'http://rubygems.org/gems/nanoc-bibtex'
  s.summary     = 'BibTeX data source for nanoc.'
  s.description = 'BibTeX data source for nanoc.'

  s.add_dependency 'nanoc',        '>= 3.0.0'
  s.add_dependency 'bibtex-ruby',  '>= 2.0.0'
  s.add_dependency 'latex-decode', '>= 0.0.12'

  s.files        = Dir.glob '{lib}/**/*'
  s.require_path = 'lib'
end
