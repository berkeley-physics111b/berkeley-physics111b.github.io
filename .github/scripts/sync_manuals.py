#!/usr/bin/env python3
"""Copy ABC.pdf, ABC_Signatures.pdf and ABC.tex for each requested acronym
from the checked-out private repo into assets/pdf/manuals/, and add a stub
entry to _data/manuals.yml for any acronym that doesn't have one yet."""
import os, re, shutil, sys

SRC = os.environ.get("SOURCE_DIR", "_source")
DEST = "assets/pdf/manuals"
YML = "_data/manuals.yml"

acronyms = [a.upper() for a in re.split(r"[,\s]+", os.environ["ACRONYMS"]) if a]
bad = [a for a in acronyms if not re.fullmatch(r"[A-Z0-9]+", a)]
if bad or not acronyms:
    sys.exit(f"Invalid or empty acronym list: {bad or acronyms}")

# index every file in the source repo by filename
index = {}
for root, dirs, files in os.walk(SRC):
    dirs[:] = [d for d in dirs if d != ".git"]
    for f in files:
        index.setdefault(f, []).append(os.path.join(root, f))

def find(name, acr):
    hits = sorted(index.get(name, []))
    if not hits:
        return None, []
    in_folder = [p for p in hits
                 if acr in [d.upper() for d in os.path.relpath(p, SRC).split(os.sep)[:-1]]]
    pool = in_folder or hits
    return pool[0], (pool[1:] if len(pool) > 1 else [])

os.makedirs(DEST, exist_ok=True)
log, failed = [], []
yml_text = open(YML).read() if os.path.exists(YML) else ""

for a in acronyms:
    wanted = {"pdf": f"{a}.pdf", "sheets": f"{a}_Signatures.pdf", "tex": f"{a}.tex"}
    found = {}
    for key, name in wanted.items():
        path, extras = find(name, a)
        if path is None:
            log.append(f"- ⚠️ {a}: `{name}` not found")
            continue
        if extras:
            log.append(f"- ⚠️ {a}: multiple `{name}` found, used `{os.path.relpath(path, SRC)}`")
        shutil.copy2(path, os.path.join(DEST, name))
        found[key] = name
        log.append(f"- ✅ {a}: `{os.path.relpath(path, SRC)}` → `{DEST}/{name}`")
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