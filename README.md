# New Data Science Project Template

This repository is cloned every time I start a new Data Science project. It provides a logical, reasonably standardized, but flexible project structure for doing and sharing data science work.

## Project Organization

---

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
    │                         generated with `pip freeze > requirements.txt`
    │
    ├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
    ├── src                <- Source code for use in this project.
    │   ├── __init__.py    <- Makes src a Python module
    │   │
    │   ├── data           <- Scripts to download or generate data
    │   │   └── make_dataset.py
    │   │
    │   ├── features       <- Scripts to turn raw data into features for modeling
    │   │   └── build_features.py
    │   │
    │   ├── models         <- Scripts to train models and then use trained models to make
    │   │   │                 predictions
    │   │   ├── predict_model.py
    │   │   └── train_model.py
    │   │
    │   └── visualization  <- Scripts to create exploratory and results oriented visualizations
    │       └── visualize.py
    │
    └── tox.ini            <- tox file with settings for running tox; see tox.readthedocs.io

---

## Pre-requisites

- Docker (optional)
- Conda or Virtualenv (optional)
- Git Bash for Windows users

## To Get Started

Refer to [getting_started.md](docs\getting_started.rst) for detailed instructions on setting up the project. Here's a brief outline of what you will find:

### Decision Table: Docker vs Conda

| Feature          | Docker                                                                 | Conda                                |
|------------------|------------------------------------------------------------------------|--------------------------------------|
| Isolation        | Complete OS-level isolation.                                           | Environment-level isolation.         |
| Complexity       | Higher initial learning curve.                                         | Easier to use for Python-specific tasks.|
| Portability      | Easily shareable as a container.                                       | Environment file can be shared, but less portable.|
| System Overhead  | Higher due to OS-level virtualization.                                 | Lower, only isolates Python environment.|
| Use Case         | Ideal for deploying apps and microservices.                            | Ideal for data science and analytics.|

### Quick Start Guide

1. **Environment Setup**: Decide between using Docker or Conda for environment setup. Follow the respective instructions in [getting_started.md](getting_started.md).

2. **Clone the Repository**:
    \`\`\`bash
    git clone <repository_url>
    \`\`\`

3. **Initial Configuration**: Change the project name and description in `Makefile`, `README.md`, `index.rst`, and `setup.py`.

4. **Dependency Installation**: Follow the instructions in [getting_started.md](getting_started.md) to install necessary dependencies.

5. **Data Setup**: Run the necessary `make` commands to set up your data. Refer to [commands.md](commands.md) for a list of available commands.

6. **Development**: Refer to [getting_started.md](getting_started.md) for guidelines on developing your data science project.

7. **Commands**: Always remember to add any new potential commands to the `getting_started.md` and `commands.md` files where necessary.
