PYTHON ?= python3
VENV := .venv
ACTIVATE := source $(VENV)/bin/activate

.PHONY: venv install optional run help clean test

venv:
	$(PYTHON) -m venv $(VENV)
	@echo "[venv] Created virtual environment in $(VENV)"

install: venv
	$(ACTIVATE); pip install --upgrade pip
	$(ACTIVATE); pip install -r requirements.txt
	@echo "[install] Core dependencies installed"

optional:
	$(ACTIVATE); pip install -r optional-requirements.txt
	@echo "[optional] Optional dependencies installed"

run:
	$(ACTIVATE); python mooc_builder.py --help

test:
	$(ACTIVATE); python test_imports.py

clean:
	rm -rf $(VENV)
	rm -rf __pycache__ */__pycache__
	@echo "[clean] Removed virtual environment and caches"

help:
	@echo "Targets: venv install optional run test clean"
