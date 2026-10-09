---
title: About
permalink: /about/
---

{% assign pages = site.about | sort: 'order' %}
<div class="card-grid">
{% for p in pages %}
  <div class="card"><h3><a href="{{ p.url | relative_url }}">{{ p.title }}</a></h3>{{ p.summary }}</div>
{% endfor %}
</div>
