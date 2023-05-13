Getting Started
===============

The following steps will guide you through the process of setting up the project:

1. **Create a Python Environment:**
   Run `make create_environment`. This command creates a new Python environment for the project using either conda (if available) or virtualenv, isolating the project dependencies from other Python projects you might have on your system.

2. **Activate the Python Environment:**
   If conda was used to create the environment, activate it with `conda activate <project_name>`. If virtualenv was used, activate the environment with `workon <project_name>`. This activates the environment for use.

3. **Install the Dependencies:**
   Run `make requirements`. This command installs the necessary Python dependencies for the project as listed in the `requirements.txt` file.

4. **Check Your Environment:**
   Run `make test_environment`. This command verifies that the Python environment is set up correctly and all dependencies are properly installed.

5. **Install Pre-commit Hooks:**
   Run `make setup`. This command installs pre-commit hooks, which automatically check your code for common issues before commits.

6. **Process the Data:**
   Run `make data`. This command runs the `src/data/make_dataset.py` script to process your data.

7. **Clean Compiled Python Files:**
   Run `make clean`. This command deletes all compiled Python files, keeping your project directory clean.

8. **Lint Your Code:**
   Run `make lint`. This command checks your code for stylistic errors using flake8 and black, ensuring code quality and consistency.

9. **Run Pre-commit on All Files:**
   Run `make precommit`. This command runs the pre-commit checks on all files in the project.

10. **Sync Data to/from S3:**
    If you're using an Amazon S3 bucket to store your data, you can sync your data to and from S3 using `make sync_data_to_s3` and `make sync_data_from_s3`. Remember to replace `[OPTIONAL] your-bucket-for-syncing-data` in the Makefile with the actual name of your S3 bucket.
