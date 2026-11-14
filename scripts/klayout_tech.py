import os
import pya

names = list(pya.Technology.technology_names())
print("KLAYOUT_PATH =", os.environ.get("KLAYOUT_PATH", "(not set)"))
print("Technologies:", names)
if not any("sky130" in n.lower() for n in names):
    raise RuntimeError("no SKY130 technology registered in KLayout")
