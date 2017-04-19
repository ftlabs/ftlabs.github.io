---
layout: wp-post
title: FT labs.ft.com
---
FT Labs is a small team at the [Financial Times](http://www.ft.com), striving to reach and engage readers with the world’s finest journalism, by looking for gaps, opportunities, concerns, and the unknown. ([...more](/about/))

We write up our work on a semi-irregular basis.

The most recent posts are:

<ul>
{% for post in site.posts limit:4 %}
<li>{{ post.date | date: "%b %-d, %Y" }} <a href="{{ post.url | relative_url }}">{{ post.title | escape }}
<blockquote>{{ post.excerpt | strip_html }}</blockquote>

  {% if post.excerpt-image %}
    {% include figure-noimgservice.html src=post.excerpt-image %}
  {% endif %}
  </a>
</li>
{% endfor %}
<li> <a href="/articles/">...more</a>.</li>
</ul>

{% include figure-noimgservice.html src="/assets/imgs/labs_poster_postits_2017_04_07_1538.jpg" %}
