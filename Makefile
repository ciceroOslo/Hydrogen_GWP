.DEFAULT_GOAL := help

VENV_DIR ?= venv
NOTEBOOK_DIR =.

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

.PHONY: help
help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

PHONY: format
format:  ## re-format files
	make isort
	make black

.PHONY: format-notebooks
format-notebooks: $(VENV_DIR)  ## format the notebooks
	@status=$$(git status --porcelain $(NOTEBOOKS_DIR)); \
	if test ${FORCE} || test "x$${status}" = x; then \
		$(VENV_DIR)/bin/black-nb $(NOTEBOOKS_DIR); \
	else \
		echo Not trying any formatting. Working directory is dirty ... >&2; \
	fi;

black: $(VENV_DIR)  ## apply black formatter to source and tests
	@status=$$(git status --porcelain src tests docs scripts); \
	if test "x$${status}" = x; then \
		$(VENV_DIR)/bin/black --exclude _version.py setup.py src tests docs/source/conf.py scripts/*.py; \
	else \
		echo Not trying any formatting. Working directory is dirty ... >&2; \
	fi;

isort: $(VENV_DIR)  ## format the code
	@status=$$(git status --porcelain src tests); \
	if test "x$${status}" = x; then \
		$(VENV_DIR)/bin/isort src tests setup.py; \
	else \
		echo Not trying any formatting. Working directory is dirty ... >&2; \
	fi;

virtual-environment:  ## update venv, create a new venv if it doesn't exist
	make $(VENV_DIR)

$(VENV_DIR): setup.py setup.cfg pyproject.toml
	[ -d $(VENV_DIR) ] || python3 -m venv $(VENV_DIR)

	$(VENV_DIR)/bin/pip3 install --upgrade pip wheel
	$(VENV_DIR)/bin/pip3 install -e .[dev]
	$(VENV_DIR)/bin/jupyter nbextension enable --py widgetsnbextension

	touch $(VENV_DIR)

first-venv: ## create a new virtual environment for the very first repo setup
	python3 -m venv $(VENV_DIR)

	$(VENV_DIR)/bin/pip install --upgrade pip
	$(VENV_DIR)/bin/pip install versioneer
	# don't touch here as we don't want this venv to persist anyway
