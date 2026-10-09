---
title: Safety
permalink: /safety/
---

Safety is the first priority in the lab. Read the relevant page before working on any experiment that involves these hazards.

<!-- TODO: add general lab safety rules, emergency contacts, and who to call. -->

{% assign pages = site.safety | sort: 'order' %}
<div class="card-grid">
{% for p in pages %}
  <div class="card"><h3><a href="{{ p.url | relative_url }}">{{ p.title }}</a></h3>{{ p.summary }}</div>
{% endfor %}
</div>
