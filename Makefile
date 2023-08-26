.PHONY: clean data lint precommit requirements sync_data_to_s3 sync_data_from_s3 test docker-build docker-run docs

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
BUCKET = [OPTIONAL] your-bucket-for-syncing-data (do not include 's3://')
PROFILE = default
PROJECT_NAME = Data-Science-Project-Boilerplate
PYTHON_INTERPRETER = python3.11
ENV_METHOD ?= conda  # Can be 'conda', 'virtualenv', or 'docker'

ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
endif

#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Set up python interpreter environment
create_environment:
ifeq ($(ENV_METHOD),conda)
	# Conda related setup
	@echo "Using Conda for environment setup..."
ifeq (True,$(HAS_CONDA))
	@echo ">>> Detected conda, creating conda environment."
	conda create --name $(PROJECT_NAME) python=3
	@echo ">>> New conda env created. Activate with:\nconda activate $(PROJECT_NAME)"
else
	@echo ">>> Conda is not installed."
endif
else ifeq ($(ENV_METHOD),docker)
	# Docker related setup
	@echo "Using Docker for environment setup..."
	docker build -t $(PROJECT_NAME) .
	@echo ">>> Docker image built. Run with:\ndocker run -it $(PROJECT_NAME)"
else
	# Virtualenv related setup
	@echo "Using virtualenv for environment setup..."
	$(PYTHON_INTERPRETER) -m pip install -q virtualenv virtualenvwrapper
	@echo ">>> Installing virtualenvwrapper if not already installed.\nMake sure the following lines are in shell startup file\n\
	export WORKON_HOME=$$HOME/.virtualenvs\nexport PROJECT_HOME=$$HOME/Devel\nsource `which virtualenvwrapper.sh`\n"
	bash -c "source `which virtualenvwrapper.sh`;mkvirtualenv $(PROJECT_NAME) --python=$(PYTHON_INTERPRETER)"
	@echo ">>> New virtualenv created. Activate with:\nworkon $(PROJECT_NAME)"
endif

## Test python environment is setup correctly
test_env:
	$(PYTHON_INTERPRETER) tests/test_environment.py

## Install Python Dependencies
requirements: test_env
	$(PYTHON_INTERPRETER) -m pip install -U pip setuptools wheel
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt --no-cache-dir

## Set up project
setup: requirements
	pre-commit install

## Delete all compiled Python files
clean:
	$(PYTHON_INTERPRETER) -c "import pathlib; [p.unlink() for p in pathlib.Path('.').rglob('*.pyc')]"

## Run pre-commit on all files
precommit:
	pre-commit run --all-files

## Make Dataset
data: requirements
	$(PYTHON_INTERPRETER) src/data/make_dataset.py data/raw data/interim data/processed

## Run all tests
tests:
	$(PYTHON_INTERPRETER) -m pytest

## Generate Project Documentation
docs:
	sphinx-build -b html docs/source docs/build
	@echo ">>> Documentation generated. Open docs/build/index.html to view it."

## Commits all changes to git after running pre-commit
commit: precommit
	@read -p "Enter commit message: " message; \
	git add .; \
	git commit -m "$$message"

## Pushes all changes to git after running pre-commit and committing
push: precommit
	@read -p "Enter commit message: " message; \
	git add .; \
	git commit -m "$$message"; \
	git push

## Upload Data to S3
sync_data_to_s3:
ifeq (default,$(PROFILE))
	aws s3 sync data/ s3://$(BUCKET)/data/
else
	aws s3 sync data/ s3://$(BUCKET)/data/ --profile $(PROFILE)
endif

## Download Data from S3
sync_data_from_s3:
ifeq (default,$(PROFILE))
	aws s3 sync s3://$(BUCKET)/data/ data/
else
	aws s3 sync s3://$(BUCKET)/data/ data/ --profile $(PROFILE)
endif

## Build Docker Image
docker-build:
	docker build -t $(PROJECT_NAME) .

## Run Docker Container
docker-run:
	docker run -it $(PROJECT_NAME)
