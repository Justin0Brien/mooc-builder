"""Quick import test to verify environment setup."""
import importlib, sys

CORE_MODULES = [
    ("ollama", "ollama"),
    ("pdfminer.high_level", "pdfminer.six"),
    ("docx", "python-docx"),
    ("pptx", "python-pptx"),
    ("pytesseract", "pytesseract"),
    ("PIL", "Pillow"),
    ("tqdm", "tqdm"),
    ("yaml", "PyYAML"),
]

missing = []
for mod, pkg in CORE_MODULES:
    try:
        importlib.import_module(mod)
    except Exception as e:
        missing.append((pkg, str(e)))

if missing:
    print("Missing or failed imports:")
    for pkg, err in missing:
        print(f" - {pkg}: {err}")
    sys.exit(1)
else:
    print("All core imports succeeded.")

try:
    importlib.import_module("whisper")
    print("Optional: whisper available.")
except Exception:
    print("Optional: whisper NOT installed (ok unless video transcription needed).")
