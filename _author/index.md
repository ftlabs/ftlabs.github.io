---
layout: wp-post
title: List of Individual Authors
---
{% for collection in site.collections %}
  {% if collection.label == 'author' %}
    {% assign default_title = collection.default %}
  {% endif %}
{% endfor %}

{% assign sorted = (site['author'] | where:"layout", "author" | sort ) %}
{% for item in sorted %}
  {% if item.title != default_title %}
* [{{ item.title }}]({{ item.url }})
  {% endif %}
{% endfor %}
