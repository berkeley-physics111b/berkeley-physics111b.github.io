---
title: Manual Appendices
permalink: /appendices/
---

{% assign pages = site.manual_appendices | sort: 'order' %}
<div class="card-grid">
{% for p in pages %}
  <div class="card"><h3><a href="{{ p.url | relative_url }}">{{ p.title }}</a></h3>{{ p.summary }}</div>
{% endfor %}
</div>