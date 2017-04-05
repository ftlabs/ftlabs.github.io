---
layout: wp-post
title: Articles
permalink: /articles/
---
{% for post in site.posts %}
* {{ post.date | date: "%b %-d, %Y" }} [{{ post.title | escape }}]({{ post.url | relative_url }})
{% endfor %}
