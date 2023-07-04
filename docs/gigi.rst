Commands
========

This document provides an overview of the common tasks that can be executed in this project using the Makefile commands.

Set up Python interpreter environment
-------------------------------------

.. code-block:: bash

    make create_environment

Description:
    Set up Python interpreter environment

Test Environment
-------------------------------------------

.. code-block:: bash

    make test_env

Description:
    Test Python environment is set up correctly

Install Dependencies
---------------------------

.. code-block:: bash

    make requirements

Description:
    Install Python Dependencies

Set up project
--------------

.. code-block:: bash

    make setup

Description:
    Setup project installing preoccommit hooks and requirements

Delete compiled files
--------------------------------

.. code-block:: bash

    make clean

Description:
    Delete all compiled Python files

Run pre-commit
---------------------------

.. code-block:: bash

    make precommit

Description:
    Run pre-commit on all files

Make Dataset
------------

.. code-block:: bash

    make data

Description:
    Make dataset from raw data into processed data

Run tests
-------------

.. code-block:: bash

    make tests

Description:
    Run all tests

Upload Data to S3
-----------------

.. code-block:: bash

    make sync_data_to_s3

Description:
    Upload Data to S3

Usage:
    Before using this command, replace `[OPTIONAL] your-bucket-for-syncing-data` in the Makefile with your actual S3 bucket name (excluding 's3://').

Download Data from S3
---------------------

.. code-block:: bash

    make sync_data_from_s3

Description:
    Download Data from S3

Usage:
    Similarly, ensure that `[OPTIONAL] your-bucket-for-syncing-data` in the Makefile is replaced with your actual S3 bucket name before using this command.
