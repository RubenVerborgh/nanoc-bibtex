## About
Thanks to this gem,
you can use [BibTeX](http://www.bibtex.org/Format/) files
as a data source for the static site compiler [nanoc](https://github.com/ddfreyne/nanoc).

## Installation
First, install the `nanoc-bibtex` gem:
```bash
$ gem install nanoc-bibtex
```

Then, load the data source on start by including this line in `lib/default.rb`:
```ruby
require 'nanoc/data_sources/bibtex_data_source'
```
