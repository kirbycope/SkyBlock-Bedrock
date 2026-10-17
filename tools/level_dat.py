"""Read and write a Bedrock level.dat: an 8-byte header (storage version, length) and little-endian NBT.

Tags are read typed and written back exactly as they were, so only what is changed differs. build_addon.py uses
this to turn every experiment off in the world it packs, since none of this world's content needs one.

    python tools/level_dat.py <level.dat>          print the experiments that are on
"""
import io
import struct
import sys

END, BYTE, SHORT, INT, LONG, FLOAT, DOUBLE, BYTE_ARRAY, STRING, LIST, COMPOUND, INT_ARRAY, LONG_ARRAY = range(13)
FIXED = {BYTE: "b", SHORT: "h", INT: "i", LONG: "q", FLOAT: "f", DOUBLE: "d"}


def read(data: bytes):
    """(header version, root name, root compound) of a level.dat's bytes."""
    version, length = struct.unpack("<ii", data[:8])
    stream = io.BytesIO(data[8:8 + length])

    def unpack(fmt): return struct.unpack("<" + fmt, stream.read(struct.calcsize(fmt)))[0]

    def string(): return stream.read(unpack("H")).decode("utf-8", "surrogateescape")

    def payload(kind):
        if kind in FIXED: return unpack(FIXED[kind])
        if kind == STRING: return string()
        if kind == BYTE_ARRAY: return stream.read(unpack("i"))
        if kind == INT_ARRAY: return [unpack("i") for _ in range(unpack("i"))]
        if kind == LONG_ARRAY: return [unpack("q") for _ in range(unpack("i"))]
        if kind == LIST:
            item = unpack("b")
            return item, [payload(item) for _ in range(unpack("i"))]
        if kind == COMPOUND:
            children = {}
            while (child := unpack("b")) != END:
                name = string(); children[name] = (child, payload(child))
            return children
        raise ValueError(f"unknown NBT tag {kind}")

    kind = unpack("b"); name = string()
    return version, name, payload(kind)


def write(version: int, name: str, root: dict) -> bytes:
    out = io.BytesIO()

    def pack(fmt, value): out.write(struct.pack("<" + fmt, value))

    def string(text):
        data = text.encode("utf-8", "surrogateescape"); pack("H", len(data)); out.write(data)

    def payload(kind, value):
        if kind in FIXED: pack(FIXED[kind], value)
        elif kind == STRING: string(value)
        elif kind == BYTE_ARRAY: pack("i", len(value)); out.write(value)
        elif kind in (INT_ARRAY, LONG_ARRAY):
            pack("i", len(value))
            for v in value: pack("i" if kind == INT_ARRAY else "q", v)
        elif kind == LIST:
            item, values = value; pack("b", item); pack("i", len(values))
            for v in values: payload(item, v)
        elif kind == COMPOUND:
            for child, (child_kind, child_value) in value.items():
                pack("b", child_kind); string(child); payload(child_kind, child_value)
            pack("b", END)

    pack("b", COMPOUND); string(name); payload(COMPOUND, root)
    body = out.getvalue()
    return struct.pack("<ii", version, len(body)) + body


def experiments_on(root: dict) -> list[str]:
    exp = root.get("experiments", (COMPOUND, {}))[1]
    return sorted(k for k, (t, v) in exp.items() if v == 1 and k not in ("experiments_ever_used", "saved_with_toggled_experiments"))


def without_experiments(data: bytes) -> bytes:
    """The level.dat with every experiment switched off, or the same bytes when none was on."""
    version, name, root = read(data)
    if not experiments_on(root): return data
    root["experiments"] = (COMPOUND, {k: (t, 0) for k, (t, v) in root["experiments"][1].items()})
    return write(version, name, root)


if __name__ == "__main__":
    print(experiments_on(read(open(sys.argv[1], "rb").read())[2]) or "no experiments")
