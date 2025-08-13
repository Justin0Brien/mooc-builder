#!/usr/bin/env bash
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_DIR="${VENV_DIR:-.venv}"

echo "[setup] Creating venv at $VENV_DIR"
$PYTHON_BIN -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

echo "[setup] Upgrading pip"
pip install --upgrade pip

echo "[setup] Installing core requirements"
pip install -r requirements.txt

if [[ "${INSTALL_OPTIONAL:-false}" == "true" ]]; then
  echo "[setup] Installing optional requirements"
  pip install -r optional-requirements.txt || echo "[warn] Optional requirements failed; continuing"
fi

echo "[setup] Done. Activate with: source $VENV_DIR/bin/activate"
