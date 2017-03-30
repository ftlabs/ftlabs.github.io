# Notes on the Jeykll-ifying of labs.ft.com

https://ftlabs.github.io/

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

* write script to process WP posts into J posts
   * obtain year, month, post name from dirs of wp post
   * extract text title from wp post
   * construct new dirs and copy file under \_posts/ex-wordpress
   * with front matter prepended
* tidy the WP pages into new dir, /ex-wordpress

## ToDo

* fix http origami refs in new posts to work with https
* tidy up refs to ?p=xxx files
* move wp-\* dirs under /ex-wordpress
   * and rewrite refs to them in posts
* create new style/layout etc for posts
* split posts into content + layout
* strip out old styling and wp refs
* add GA tracking back in
* rethink front page
* consider using collections
* ...
* redirect labs.ft.com to fastly to new blog
