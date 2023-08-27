Commands
========

This section provides an exhaustive list of commands in the Makefile, organized by functionality. Each command is followed by a description and potential points of failure.

Environment Setup (Choose One)
------------------------------

Docker Operations (Optional)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Build Docker Image**

.. code-block:: bash

    docker build -t my_project .

- **Description**: Build a Docker image encapsulating all project dependencies.
- **If Chosen**: Skip to 'Dependencies and Setup'

.. admonition:: Troubleshooting

    If build fails, check the Dockerfile and logs for issues.

**Run Docker Container**

.. code-block:: bash

    docker run -it my_project

- **Description**: Run and interact with the project within the Docker container.


Python Environment Setup (If not using Docker)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Create Python Environment**

.. code-block:: bash

    make create_environment

- **Description**: Initialize Python interpreter environment.

.. admonition:: Troubleshooting

    Ensure either `conda` or `virtualenv` is installed.

**Test Environment Configuration**

.. code-block:: bash

    make test_env

- **Description**: Verify Python environment setup.


Dependencies and Setup (If not using Docker)
--------------------------------------------

**Install Dependencies**

.. code-block:: bash

    make requirements

- **Description**: Install necessary Python packages.

**Project Setup**

.. code-block:: bash

    make setup

- **Description**: Setup project, install pre-commit hooks and requirements.


Cleanup
-------

**Delete Compiled Files**

.. code-block:: bash

    make clean

- **Description**: Remove compiled Python files.


Code Quality Checks
-------------------

**Run Pre-commit Hooks**

.. code-block:: bash

    make precommit

- **Description**: Run pre-commit hooks on all staged files.


Data Operations
---------------

**Generate Dataset**

.. code-block:: bash

    make data

- **Description**: Convert raw data into a processed dataset.


Model Operations
----------------

**Save Trained Model**

.. code-block:: bash

    make save_model

- **Description**: Save the trained machine learning model as a .pkl file.
- **Location**: The model will be saved in the `models/` directory.

.. admonition:: Troubleshooting

    If saving fails, ensure that the model exists and the directory is writable.


Testing
-------

**Run Tests**

.. code-block:: bash

    make tests

- **Description**: Execute all unit tests.


Version Control
---------------

**Commit Changes**

.. code-block:: bash

    make commit

- **Description**: Commit all staged changes.
- **Usage**: Prompted for a commit message.

**Push Changes**

.. code-block:: bash

    make push

- **Description**: Push commits to remote repository.


Documentation
-------------

**Generate Documentation**

.. code-block:: bash

    make docs

- **Description**: Generate project documentation using Sphinx.

.. admonition:: Troubleshooting

    If documentation generation fails, ensure Sphinx is installed and check the Sphinx configuration file (usually `conf.py` in the `docs` directory).


S3 Operations
-------------

**Upload Data to S3**

.. code-block:: bash

    make sync_data_to_s3

- **Description**: Upload data to an S3 bucket.
- **Usage**: Replace placeholder with your S3 bucket name in Makefile.

**Download Data from S3**

.. code-block:: bash

    make sync_data_from_s3

- **Description**: Download data from an S3 bucket.
- **Usage**: Replace placeholder with your S3 bucket name in Makefile.
