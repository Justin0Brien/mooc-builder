# MOOC Builder

Utility to scan a directory of legacy teaching materials (PowerPoint, Keynote, Word, PDF, text, images, video), extract text, normalise into clean Markdown using a local LLM served by Ollama (`ollama` Python client to a running local Ollama server), auto-classify into subject areas, and generate structured outputs (lecture notes, slide outline, quiz, etc.).

## 1. Features

- Local-only processing (no data leaves your machine)
- Chunked LLM processing with consolidation
- Subject classification + index generation
- Optional OCR (Tesseract) and video transcription (Whisper + ffmpeg)

## 2. Quick Start

```bash
git clone <repo> mooc
cd mooc
bash setup_env.sh             # Creates .venv and installs core deps
source .venv/bin/activate
python mooc_builder.py --help
```

Minimal example run (no OCR/video):

```bash
python mooc_builder.py \
  --input-dir /path/to/source_materials \
  --output-dir ./output \
  --model gpt-oss
```

## 3. Dependencies

Python packages (installed via `requirements.txt`):

```text
ollama
pdfminer.six
python-docx
python-pptx
pytesseract
Pillow

PyYAML
```

Optional (video transcription):

```text
openai-whisper
```

### System Packages (optional but recommended)

- Tesseract OCR: `brew install tesseract` (macOS) / `apt-get install tesseract-ocr`
- ffmpeg (video audio extraction): `brew install ffmpeg` / `apt-get install ffmpeg`

## 4. Ollama Models

Ensure the desired model is available locally via Ollama. Examples:

```bash
ollama pull gpt-oss
ollama pull mistral
ollama list
```

Then pass the model name with `--model` (e.g., `gpt-oss`, `llama3.2`, `mistral`).

## 5. Optional Extras

Enable OCR: add `--ocr` (requires Tesseract + pytesseract + Pillow).
Enable video transcription: add `--transcribe-video` (requires ffmpeg + openai-whisper). You can pick a different Whisper size with `--whisper-model`.

## 6. Ignoring Files

Use repeated `--ignore` globs, e.g.:

```bash
--ignore "**/draft_*" --ignore "**/*.bak"
```

## 7. Caching

A JSON cache (`.mooc_cache.json`) stores processed file outputs keyed by a hash of path + mtime + size. Delete it to force reprocessing.

## 8. Development Helpers

Make targets:

```bash
make install   # venv + core deps
make optional  # optional deps
make run       # show CLI help
make test      # import test
```

## 9. Troubleshooting

- If `ollama` import fails, ensure `pip install ollama` and the Ollama daemon/app is running.
- If Keynote export fails, ensure Keynote is installed and grant automation permissions.
- OCR empty? Verify `tesseract --version` works and language data is installed.
- Whisper slow? Try a smaller model (`--whisper-model tiny` or `base`).

## 10. License

Add your license here.

---

Generated project scaffolding for convenient execution of `mooc_builder.py`.
