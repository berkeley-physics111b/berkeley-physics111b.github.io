#!/usr/bin/env python3
"""For each requested acronym:
  - copy ABC.pdf and ABC_Signatures.pdf from the downloaded latest release assets (RELEASE_DIR)
  - copy ABC.tex from the checked-out source repo (SOURCE_DIR, searched recursively,
    preferring a folder named ABC)
into assets/pdf/manuals/, and add a stub entry to _data/manuals.yml if none exists."""
import os, re, shutil, sys

SRC = os.environ.get("SOURCE_DIR", "_source")
REL = os.environ.get("RELEASE_DIR", "_release")
TAG = os.environ.get("RELEASE_TAG", "unknown")
DEST = "assets/pdf/manuals"
YML = "_data/manuals.yml"

acronyms = [a.upper() for a in re.split(r"[,\s]+", os.environ["ACRONYMS"]) if a]
bad = [a for a in acronyms if not re.fullmatch(r"[A-Z0-9]+", a)]
if bad or not acronyms:
    sys.exit(f"Invalid or empty acronym list: {bad or acronyms}")

def build_index(base):
    idx = {}
    for root, dirs, files in os.walk(base):
        dirs[:] = [d for d in dirs if d != ".git"]
        for f in files:
            idx.setdefault(f, []).append(os.path.join(root, f))
    return idx

src_index, rel_index = build_index(SRC), build_index(REL)

def find(index, base, name, acr):
    hits = sorted(index.get(name, []))
    if not hits:
        return None, False
    in_folder = [p for p in hits
                 if acr in [d.upper() for d in os.path.relpath(p, base).split(os.sep)[:-1]]]
    pool = in_folder or hits
    return pool[0], len(pool) > 1

os.makedirs(DEST, exist_ok=True)
log, failed = [f"Latest release: `{TAG}`"], []
yml_text = open(YML).read() if os.path.exists(YML) else ""

for a in acronyms:
    wanted = [  # (key, filename, index, base, origin label)
        ("pdf",    f"{a}.pdf",            rel_index, REL, "release"),
        ("sheets", f"{a}_Signatures.pdf", rel_index, REL, "release"),
        ("tex",    f"{a}.tex",            src_index, SRC, "repo"),
    ]
    found = {}
    for key, name, idx, base, origin in wanted:
        path, multiple = find(idx, base, name, a)
        if path is None:
            log.append(f"- ⚠️ {a}: `{name}` not found in {origin}")
            continue
        if multiple:
            log.append(f"- ⚠️ {a}: multiple `{name}` found in {origin}, used `{os.path.relpath(path, base)}`")
        shutil.copy2(path, os.path.join(DEST, name))
        found[key] = name
        log.append(f"- ✅ {a}: `{name}` ({origin}) → `{DEST}/{name}`")
    if not found:
        failed.append(a)
        log.append(f"- ❌ {a}: no files found, skipped")
        continue
    if not re.search(rf"^\s*slug:\s*{re.escape(a)}\s*$", yml_text, re.M):
        block = f"- title: {a}\n  description: TODO\n  slug: {a}\n"
        if "pdf" in found:
            block += f"  pdf: {found['pdf']}\n"
        if "sheets" in found:
            block += f"  sheets: {found['sheets']}\n"
        if yml_text and not yml_text.endswith("\n"):
            yml_text += "\n"
        yml_text += block
        log.append(f"- 📝 {a}: added stub entry to `{YML}` (fill in title/description)")

open(YML, "w").write(yml_text)
summary = "\n".join(["## Sync manuals", *log])
print(summary)
if os.environ.get("GITHUB_STEP_SUMMARY"):
    open(os.environ["GITHUB_STEP_SUMMARY"], "a").write(summary + "\n")
if len(failed) == len(acronyms):
    sys.exit("No files found for any requested acronym")