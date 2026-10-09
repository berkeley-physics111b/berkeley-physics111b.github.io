---
title: Manuals
permalink: /manuals/
---

Write-ups and signature sheets for each experiment. TeX files are accessible for screen readers.

<table>
  <thead><tr><th>Experiment</th><th>Manual</th><th>Pre-lab</th><th>Mid-lab</th></tr></thead>
  <tbody>
  {% for m in site.data.manuals %}
    <tr>
      <td><strong>{{ m.title }}</strong><br>{{ m.description }}</td>
      <td>{% if m.pdf %}<a href="{{ '/assets/pdf/manuals/' | append: m.pdf | relative_url }}">PDF</a>{% endif %}</td>
      <td>{% if m.prelab %}<a href="{{ '/assets/pdf/manuals/' | append: m.prelab | relative_url }}">PDF</a>{% endif %}</td>
      <td>{% if m.midlab %}<a href="{{ '/assets/pdf/manuals/' | append: m.midlab | relative_url }}">PDF</a>{% endif %}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>
