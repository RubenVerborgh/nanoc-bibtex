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

## Usage
Modify your `config.yaml` to include your data source:
```yaml
data_sources:
  -
    type: filesystem_unified
    items_root: /
    layouts_root: /
  -
    type: bibtex
    items_root: /publications
    config:
      path: assets/publications/
      exclude:
        - abstract
```
The above example configures your site with an additional `bibtex` data source.
It will load the entries of each BibTeX file in the folder `assets/publications`
as items whose path will be `/publications/{citation_key}`.

The fields of each item will contain the values of the corresponding BibTeX entry.
The raw contents of this item will be the BibTeX entry,
excluding the `abstract` field. 
