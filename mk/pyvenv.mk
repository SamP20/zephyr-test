BASE_PYTHON := python3
VENV_DIR := $(PROJECT_ROOT).venv/
PYTHON := $(VENV_DIR)bin/python3

$(PYTHON): | $(VENV_DIR)

$(VENV_DIR):
	$(BASE_PYTHON) -m venv $@