# ftlabs.github.io

GitHub hosted blog of FT Labs

## Local setup

```
$ gem install jekyll bundler
$ bundle exec jekyll serve
```

On a successful ```jekyll serve``` the console will tell you what localhost URL you can find the local site on

### Troubleshooting

#### Attempting to run 'jekyll new ftlabs'

If you get this error:

```
/Library/Ruby/Gems/2.3.0/gems/bundler-2.0.1/lib/bundler/spec_set.rb:87:in `block in materialize': Could not find addressable-2.5.2 in any of the sources (Bundler::GemNotFound)
```

You may need to run ```bundle update``` to see if there were any issues (download or permissions) with your installation.

---

If you get this error:

```
/Library/Ruby/Gems/2.3.0/gems/bundler-2.0.1/lib/bundler/runtime.rb:319:in `check_for_activated_spec!': You have already activated liquid 4.0.1, but your Gemfile requires liquid 3.0.6. Prepending `bundle exec` to your command may solve this. (Gem::LoadError)
```

You can run ```bundle exec jekyll new ftlabs``` to allow the command to complete

---

## [Archived] Notes on the Jeykll-ifying of labs.ft.com

https://ftlabs.github.io/

### steps

#### recursive web suck of labs.ft.com

via https://darcynorman.net/2011/12/24/archiving-a-wordpress-website-with-wget/

using `$ wget --mirror -p --html-extension --convert-links -e robots=off -P . http://labs.ft.com`

#### build basic Jekyll instance

via https://jekyllrb.com/

```
$ gem install jekyll bundler
$ jekyll new ftlabs
$ cd ftlabs
~/ftlabs $ bundle exec jekyll serve
```

#### overlay full web suck

gratifyingly, kinda worked

#### process web sucked files

* write script to process WP posts into J posts
   * obtain year, month, post name from dirs of wp post
   * extract text title from wp post
   * construct new dirs and copy file under \_posts/ex-wordpress
   * with front matter prepended
* tidy the WP pages into new dir, /ex-wordpress
* fix http origami+cloudflare+brightcove refs in new posts to use https
* split posts into content + layout
   * with new layout: wp-post
* ported some pages (contact-us, jobs) into wp-post layout
* tidy up refs to ?p=xxx / %3Fp= files
* add GA tracking back in
* recover missing pages: /articles/(ft-fastclick,the-economist,ft-columnflow)
* recover missing category pages, e.g. /category/technote
* rewrite About
* handle authors?
   * consider using collections
* tidy /author/ftlabs (default author)

### ToDo

* port /asset/... videos to youtube because accessibility (having been moved to /asset/... because no longer Brightcove)
