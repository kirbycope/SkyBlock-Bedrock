"""Builds SkyBlock-Bedrock.mctemplate from the repository, so nothing is copied into a zip by hand.

The archive is what Minecraft imports when the file is double-clicked: the world template's own files at the
root, and the packs under behavior_packs/ and resource_packs/, each with its manifest.json directly inside.

The packs are the files git tracks in the development folders, so a pack change is all a release needs. The
world itself (the template's manifest.json, level.dat, db/ and the rest) is not all tracked as source here, so
it is taken from the SkyBlock-Bedrock.mctemplate committed at the root of the repository, which this reads and never writes.
The pack lists, world_behavior_packs.json and world_resource_packs.json, are written from the packs' manifests,
so bumping a manifest version is enough. db/CURRENT is given a bare LF ending, since LevelDB refuses a CRLF
one and a template zipped from a Windows checkout can carry it. The build goes to build/, which git ignores.

    python tools/build_addon.py            # writes build/SkyBlock-Bedrock.mctemplate
    python tools/build_addon.py --check    # exits 1 if the archive on disk differs from what a build would produce

What Minecraft requires of the zip: entries at the root (no wrapping folder), forward slashes in entry names,
Deflate or Store, no zip64. Images and sounds, already compressed, are stored rather than deflated.
"""

import argparse
import io
import json
import os
import subprocess
import sys
import zipfile

from level_dat import without_experiments

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TEMPLATE = os.path.join(ROOT, "SkyBlock-Bedrock.mctemplate")   # the committed template, read for the world only
PACKS = {   # folder in the archive -> pack in the repository
    "behavior_packs/SkyBlock": "development_behavior_packs/SkyBlock",
    "resource_packs/SkyBlock": "development_resource_packs/SkyBlock",
}
OUTPUT = os.path.join(ROOT, "build", "SkyBlock-Bedrock.mctemplate")
LISTS = {"behavior_packs": "world_behavior_packs.json", "resource_packs": "world_resource_packs.json"}
STAMP = (2026, 1, 1, 0, 0, 0)   # a fixed timestamp keeps the archive byte-for-byte reproducible, so --check can compare it
STORED = {".png", ".jpg", ".jpeg", ".ogg", ".fsb"}
LIMIT = 100 * 1024 * 1024   # GitHub refuses a file over 100 MB


def tracked(pack: str) -> list[str]:
    """The files git tracks under a pack, as paths relative to it, sorted, those deleted from the working tree left out."""
    out = subprocess.run(["git", "-C", ROOT, "ls-files", "-z", "--", pack], check=True, capture_output=True).stdout.decode("utf-8")
    return sorted(p[len(pack) + 1:] for p in out.split("\0") if p and os.path.isfile(os.path.join(ROOT, p)))


def world() -> list[tuple[str, bytes]]:
    """The committed template's own files, moved to the root if it wrapped them in a folder, without its packs or pack lists."""
    with zipfile.ZipFile(TEMPLATE) as archive:
        files = [(i.filename.replace("\\", "/"), i) for i in archive.infolist() if not i.is_dir()]
        manifest = min((name for name, _ in files if os.path.basename(name) == "manifest.json"), key=lambda name: name.count("/"))
        wrap = manifest[:-len("manifest.json")]
        entries = []
        for name, info in files:
            relative = name[len(wrap):]
            if not name.startswith(wrap) or relative.split("/")[0] in LISTS or relative in LISTS.values():
                continue
            data = archive.read(info)
            if relative == "db/CURRENT":   # LevelDB wants a bare LF here; a template zipped on Windows can carry CRLF
                data = data.replace(b"\r\n", b"\n")
            if relative == "level.dat":   # the committed world may still have an experiment on that nothing here needs
                data = without_experiments(data)
            entries.append((relative, data))
    return sorted(entries)


def pack_list(kind: str) -> bytes | None:
    """The world's list of packs of one kind, written from their manifests, or None when it has none of that kind."""
    entries = []
    for folder, pack in PACKS.items():
        if folder.split("/")[0] == kind:
            with open(os.path.join(ROOT, pack, "manifest.json"), encoding="utf-8-sig") as handle:
                header = json.load(handle)["header"]
            entries.append({"pack_id": header["uuid"], "version": header["version"]})
    return (json.dumps(entries, indent="\t") + "\n").encode("utf-8") if entries else None


def build() -> bytes:
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w", zipfile.ZIP_DEFLATED, allowZip64=False) as archive:
        seen: set[str] = set()

        def add_dir(path: str) -> None:
            parts = path.split("/")
            for depth in range(1, len(parts)):
                folder = "/".join(parts[:depth]) + "/"
                if folder in seen: continue
                seen.add(folder)
                info = zipfile.ZipInfo(folder, STAMP)
                info.external_attr = 0o40777 << 16
                archive.writestr(info, b"", zipfile.ZIP_STORED)

        def add(path: str, data: bytes) -> None:
            add_dir(path)
            info = zipfile.ZipInfo(path, STAMP)
            info.external_attr = 0o666 << 16
            info.compress_type = zipfile.ZIP_STORED if os.path.splitext(path)[1].lower() in STORED else zipfile.ZIP_DEFLATED
            archive.writestr(info, data, compresslevel=9)

        for path, data in world():
            add(path, data)
        for kind, name in LISTS.items():
            data = pack_list(kind)
            if data is not None:
                add(name, data)
        for folder, pack in PACKS.items():
            for relative in tracked(pack):
                with open(os.path.join(ROOT, pack, relative), "rb") as handle:
                    add(f"{folder}/{relative}", handle.read())
    return buffer.getvalue()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--check", action="store_true", help="report whether the archive is up to date instead of writing it")
    parser.add_argument("--output", default=OUTPUT)
    args = parser.parse_args()

    data = build()
    if len(data) > LIMIT:
        print(f"refusing to write {len(data)} bytes, over GitHub's 100 MB limit", file=sys.stderr)
        return 1
    current = os.path.exists(args.output) and open(args.output, "rb").read() == data
    if args.check:
        print("up to date" if current else f"out of date: {os.path.relpath(args.output, ROOT)}")
        return 0 if current else 1
    os.makedirs(os.path.dirname(os.path.abspath(args.output)), exist_ok=True)
    with open(args.output, "wb") as handle:
        handle.write(data)
    print(f"wrote {os.path.relpath(args.output, ROOT)} ({len(data)} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
