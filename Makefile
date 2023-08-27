.PHONY: clean data lint precommit requirements coverage test_all docker-build docker-run docs aws_check sync_data_to_s3 sync_data_from_s3

.SHELLFLAGS = -e  # Stop if any command fails

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(abspath $(lastword $(MAKEFILE_LIST))))
BUCKET ?=
PROFILE = default
PROJECT_NAME = Data-Science-Project-Boilerplate
PYTHON_INTERPRETER = python3.11
ENV_METHOD = conda # conda, docker

export PYTHONPATH=$(PROJECT_DIR)

ifeq (,$(shell which $(PYTHON_INTERPRETER)))
    $(error $(PYTHON_INTERPRETER) is not installed)
endif

ifeq (,$(shell which conda))
HAS_CONDA=False
else
HAS_CONDA=True
endif

#################################################################################
# COMMANDS                                                                      #
#################################################################################

ifeq ($(ENV_METHOD),conda)
CREATE_ENV_CMD = $(if $(HAS_CONDA),conda create --name $(PROJECT_NAME) python=3.11,echo ">>> Conda is not installed.")
else ifeq ($(ENV_METHOD),docker)
CREATE_ENV_CMD = docker build -t $(PROJECT_NAME) .
endif

## Create python environment and install dependencies
create_environment: requirements
	@echo "Creating environment..."
	@$(CREATE_ENV_CMD)

## Test python environment
test_env:
	$(PYTHON_INTERPRETER) tests/test_environment.py

## Install Python Dependencies
requirements:
	$(PYTHON_INTERPRETER) -m pip install -U pip setuptools wheel
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt --no-cache-dir

## Set up project
setup: create_environment test_env requirements
	pre-commit install

define CLEAN_CMD
import pathlib
[p.unlink() for p in pathlib.Path('.').rglob('*.pyc')]; [p.unlink() for p in pathlib.Path('.').rglob('*.log')]; [p.unlink() for p in pathlib.Path('.').rglob('*.tmp')]; [p.rmdir() for p in pathlib.Path('dist').rglob('*')]
endef
export CLEAN_CMD

## Delete all compiled Python files
clean:
	$(PYTHON_INTERPRETER) -c "$$CLEAN_CMD"

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
test_all:
	$(PYTHON_INTERPRETER) -m pytest

## Generate Project Documentation
docs:
	sphinx-build -b html docs/source docs/build
	@echo ">>> Documentation generated. Open docs/build/index.html to view it."

## Commits all changes to git after running pre-commit
commit: precommit
	@read -p "Enter commit message: " message; \
	git add -A; \
	git commit -m "$$message"

## Pushes all changes to git after running pre-commit and committing
push: precommit
	@read -p "Enter commit message: " message; \
	git add -A; \
	git commit -m "$$message"; \
	git push

## AWS CLI check
aws_check:
	@if [ -z $(shell which aws) ]; then echo "AWS CLI not found. Install it."; exit 1; fi

## Upload Data to S3
sync_data_to_s3: aws_check
ifeq ($(BUCKET),)
	@echo "BUCKET is undefined. Skipping AWS S3 sync."
else
	ifeq (default,$(PROFILE))
		aws s3 sync data/ s3://$(BUCKET)/data/
	else
		aws s3 sync data/ s3://$(BUCKET)/data/ --profile $(PROFILE)
	endif
endif

## Download Data from S3
sync_data_from_s3: aws_check
ifeq ($(BUCKET),)
	@echo "BUCKET is undefined. Skipping AWS S3 sync."
else
	ifeq (default,$(PROFILE))
		aws s3 sync s3://$(BUCKET)/data/ data/
	else
		aws s3 sync s3://$(BUCKET)/data/ data/ --profile $(PROFILE)
	endif
endif

## Build Docker Image
docker-build:
	docker build -t $(PROJECT_NAME) .

## Run Docker Container
docker-run:
	docker run -it $(PROJECT_NAME)
