# Physics 111B Experimentation Lab site

A Jekyll site for GitHub Pages. No plugins or themes, so GitHub builds it automatically.

## Deploy
1. Push this folder to a GitHub repo.
2. Settings → Pages → Deploy from branch → `main` / root.
3. If the site lives at `user.github.io/repo-name`, set `baseurl: "/repo-name"` in `_config.yml`.

## Adding a page to a dropdown
Create a `.md` file in the matching folder. It appears in the dropdown and on the section landing page automatically.

| Dropdown | Folder |
|---|---|
| Safety | `_safety/` |
| Documentation | `_documentation/` |
| About | `_about/` |

Minimum front matter:
```yaml
---
title: Magnets
order: 4          # position in the dropdown (lower = higher)
summary: One line shown on the section landing page.
pdf: /assets/pdf/safety/magnets.pdf   # optional "Download PDF" button
---
Page content in Markdown.
```
To rename or reorder existing pages, edit `title` / `order`.

## Where files go
| What | Where |
|---|---|
| Experiment manuals / pre-lab / mid-lab PDFs | `assets/pdf/manuals/` (then list in `_data/manuals.yml`) |
| Safety PDFs | `assets/pdf/safety/` |
| OTZ / BMC / QIE PDFs | `assets/pdf/documentation/otz/`, `.../bmc/`, `.../qie/` |
| About PDFs | `assets/pdf/about/` |
| Images | `assets/img/` |

Link to a file from any page:
```
[Radiation training]({{ '/assets/pdf/safety/radiation.pdf' | relative_url }})
![Photo]({{ '/assets/img/lab.jpg' | relative_url }})
```

## Adding a manual
Add a block to `_data/manuals.yml`; the Manuals table updates itself.

## Local preview
`bundle exec jekyll serve` (needs Ruby + `gem install jekyll`).
