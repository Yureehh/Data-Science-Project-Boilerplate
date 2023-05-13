Commands
========

This document provides an overview of the common tasks that can be executed in this project using the Makefile commands.

Syncing Data with S3
--------------------

`make sync_data_to_s3` and `make sync_data_from_s3` are commands to synchronize your data to and from an Amazon S3 bucket.

**Upload Data to S3**

Command:
    make sync_data_to_s3

Description:
    This command uses `aws s3 sync` to recursively sync files in the `data/` directory to your specified S3 bucket.

Usage:
    Before using this command, replace `[OPTIONAL] your-bucket-for-syncing-data` in the Makefile with your actual S3 bucket name (excluding 's3://'). 

**Download Data from S3**

Command:
    make sync_data_from_s3

Description:
    This command uses `aws s3 sync` to recursively sync files from your specified S3 bucket to the `data/` directory.

Usage:
    Similarly, ensure that `[OPTIONAL] your-bucket-for-syncing-data` in the Makefile is replaced with your actual S3 bucket name before using this command.
