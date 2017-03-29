# Notes on the Jeykll-ifying of labs.ft.com

## steps

### recursive web suck of labs.ft.com

via https://darcynorman.net/2011/12/24/archiving-a-wordpress-website-with-wget/

using `$ wget --mirror -p --html-extension --convert-links -e robots=off -P . http://labs.ft.com`

### build basic Jekyll instance

via https://jekyllrb.com/

```
$ gem install jekyll bundler
$ jekyll new ftlabs
$ cd ftlabs
~/ftlabs $ bundle exec jekyll serve
```

### overlay full web suck

gratifyingly, kinda worked

### process web sucked files

* remove most of index?... files
* rename index.html to index_origwp.html (and hence back to the default index with the one default post)
*

## ToDo

* put front matter in posts
* split old front page into segments: header, LHS, footer, etc
* ...
