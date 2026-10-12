---
title: Manuals
permalink: /manuals/
---

Write-ups and signature sheets for each experiment. TeX files are accessible for screen readers.

{% assign base = '/assets/pdf/manuals/' %}
<table>
  <thead>
    <tr><th>Manuals</th><th>Pre-lab, Mid-lab, &amp; Signature Sheet</th><th>TeX files</th></tr>
  </thead>
  <tbody>
  {% for m in site.data.manuals %}
    <tr>
      <td>
        {% if m.pdf %}<a href="{{ base | append: m.pdf | relative_url }}"><strong>{{ m.title }}</strong></a>{% else %}<strong>{{ m.title }}</strong>{% endif %}
        {% if m.description %}<br>{{ m.description }}{% endif %}
      </td>
      <td>
        {% if m.sheets %}<a href="{{ base | append: m.sheets | relative_url }}">Pre-lab, Mid-lab, &amp; Signature Sheet</a>{% endif %}
      </td>
      <td>
        {% for f in site.static_files %}
          {% if f.extname == '.tex' and f.path contains base and f.name contains m.slug %}
            <a href="{{ f.path | relative_url }}">{{ f.name }}</a><br>
          {% endif %}
        {% endfor %}
      </td>
    </tr>
  {% endfor %}
  </tbody>
</table>