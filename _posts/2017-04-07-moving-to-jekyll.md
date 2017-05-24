---
layout: post
title:  "Moving to Jekyll"
date:   2017-05-16 14:05:03 +0100
categories: jekyll
teaser: Notes
excerpt: >
  A brief note to indicate we have migrated the FT Labs blog from WordPress to Jekyll.
---
A brief note to indicate we have migrated the FT Labs blog from WordPress to [Jekyll](https://jekyllrb.com/).

## Why not WordPress ?

* WordPress, whilst being largely fine, involved too much peripheral hassle.
* The theme we were using was in a bit of a mess.
* We had no immediately available WordPress skills (nor did we particularly want any).

## Why Jekyll ?

* Jekyll gives us easy access to all parts of the blog, and we can easily build it locally.
* By using our ftlabs org GitHub accounts for Jekyll admin access, we can remove the need to maintain accounts in WordPress.
* Increased visibility of the blog and [its workings](https://github.com/ftlabs/ftlabs.github.io) to FT tech people.
* We can use the lovely [GitHub Pages as a host](https://help.github.com/articles/about-github-pages-and-jekyll/), and remove another system from the list of Things We Have To Worry About (tm).
* Jekyll+Liquid is fun, robust, transparent and, so far, has let us do whatever we've thought of.

## Gotchas

* We have striven to persist the permalinks of the old FT Labs posts.
* Now that we have set up GH Pages for the whole org, with a custom domain ([labs.ft.com](http://labs.ft.com)), we've had to unpick some of the lower-level, repo-specific GH Pages. They now all also share the same custom domain.
* We are slowly teasing out all the WordPress-isms which resulted from the initial, fairly brutal, [recursive web-suck](http://www.krazyworks.com/wget-examples-and-scripts/)
* Does not yet seem to have lead to a marked increase in the rate at which we write new posts, so may simply have been a fine example of [Yak Shaving](https://en.wiktionary.org/wiki/yak_shaving).
