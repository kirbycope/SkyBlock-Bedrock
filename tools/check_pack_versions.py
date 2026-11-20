"""Checks that every pack's description ends with its own version, so an installed copy shows which release it is.

Minecraft lists a pack by its name and description and nowhere shows the version number, so a player with an old
copy cannot tell. Each manifest.json's header description therefore ends with the header version, "MineKart
Behavior Pack 1.2.2", or "(v1.2.2)" after a description that is a sentence. On a tag push (v1.2.2) every pack must
also carry the tag's version, so a release cannot ship packs left on an older number.

    python tools/check_pack_versions.py    # exits 1 and names each manifest that disagrees
"""

import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def manifests() -> list[str]:
    out = subprocess.run(["git", "-C", ROOT, "ls-files", "-z", "--", "*manifest.json"], check=True, capture_output=True).stdout.decode("utf-8")
    return [p for p in out.split("\0") if p and os.path.basename(p) == "manifest.json"]


def main() -> int:
    tag = os.environ.get("GITHUB_REF_NAME", "") if os.environ.get("GITHUB_REF_TYPE") == "tag" else ""
    problems = []
    for path in manifests():
        with open(os.path.join(ROOT, path), encoding="utf-8-sig") as handle:
            header = json.load(handle).get("header")
        if not isinstance(header, dict) or not isinstance(header.get("version"), list):
            continue
        version = ".".join(str(part) for part in header["version"])
        description = header.get("description", "")
        if not (description.endswith(f" {version}") or description.endswith(f"(v{version})")):
            problems.append(f"{path}: description {description!r} does not end with its version {version}")
        if tag and tag.lstrip("v") != version:
            problems.append(f"{path}: version {version} is not the tag's {tag}")
    for problem in problems:
        print(problem, file=sys.stderr)
    print("pack versions ok" if not problems else f"{len(problems)} problem(s)")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
