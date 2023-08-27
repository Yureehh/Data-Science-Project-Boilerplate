.PHONY: clean data lint precommit requirements sync_data_to_s3 sync_data_from_s3 test docker-build docker-run docs

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
BUCKET = [OPTIONAL] your-bucket-for-syncing-data (do not include 's3://')
PROFILE = default
PROJECT_NAME = Data-Science-Project-Boilerplate
PYTHON_INTERPRETER = python3.11
ENV_METHOD = conda# conda, docker, virtualenv

ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
endif

#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Set up python interpreter environment
ifeq ($(ENV_METHOD),conda)
CREATE_ENV_CMD = $(if $(HAS_CONDA),conda create --name $(PROJECT_NAME) python=3,echo ">>> Conda is not installed.")
else ifeq ($(ENV_METHOD),docker)
CREATE_ENV_CMD = docker build -t $(PROJECT_NAME) .
else
CREATE_ENV_CMD = $(PYTHON_INTERPRETER) -m pip install -q virtualenv virtualenvwrapper; \
                 source `which virtualenvwrapper.sh`; \
                 mkvirtualenv $(PROJECT_NAME) --python=$(PYTHON_INTERPRETER)
endif

create_environment:
	@echo "Creating environment..."
	@$(CREATE_ENV_CMD)


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

## Save trained model as .pkl
save_model:
	$(PYTHON_INTERPRETER) src/models/save_model.py


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
