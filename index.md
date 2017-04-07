---
layout: wp-post
title: FT labs.ft.com
---
FT Labs is a small team at the [Financial Times](http://www.ft.com), striving to reach and engage readers with the world’s finest journalism, by looking for gaps, opportunities, concerns, and the unknown. ([...more](/about/))

We write up our work on a semi-irregular basis.

The most recent posts are:

{% for post in site.posts limit:3 %}
* {{ post.date | date: "%b %-d, %Y" }} [{{ post.title | escape }}]({{ post.url | relative_url }})
> {{ post.excerpt | strip_html }}

{% endfor %}
* [...more](/articles/).

{% include figure-noimgservice.html src="/assets/imgs/labs_poster_postits_2017_04_07_1538.jpg" %}
