---
layout: wp-post
title: List of Categories
---

{% for category in site.categories %}
{% assign name = category[0] %}
{% if name != 'ex-wordpress' and name != 'jekyll' %}
* [{{ name }}](/category/{{ name }}) ({{ category | last | size }})
{% endif %}
{% endfor %}
