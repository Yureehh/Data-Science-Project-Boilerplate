Getting Started
===============

The following steps will guide you through the process of setting up the project:

0. **Change the name:**
   Search and replace all instances of Data-Science-Project-Boilerplate with the new name of your project. This includes the README.md file, the Makefile, and the setup.py file.

1. **Mind the Terminal You're Using:**
   If you are on Linux or macOS, you can use the default terminal. If you are on Windows, you should use `Git Bash` instead of `cmd` or `PowerShell`. This is because `Git Bash` is a Unix-like terminal, which is required for some of the commands in the Makefile.

2. **Create a Python Environment:**
   Run `make create_environment`. This command creates a new Python environment for the project using either conda (if available) or virtualenv, isolating the project dependencies from other Python projects you might have on your system.

3. **Activate the Python Environment:**
   If conda was used to create the environment, activate it with `conda activate <project_name>`. If virtualenv was used, activate the environment with `workon <project_name>`. This activates the environment for use.

4. **Install the Dependencies:**
   Run `make requirements`. This command installs the necessary Python dependencies for the project as listed in the `requirements.txt` file.

5. **Install Pre-commit Hooks:**
   Run `make setup`. This command installs pre-commit hooks, which automatically check your code for common issues before commits.

6. **Process the Data:**
   Run `make data`. This command runs the `src/data/make_dataset.py` script to process your data.

7. **Clean Compiled Python Files:**
   Run `make clean`. This command deletes all compiled Python files, keeping your project directory clean.

8. **Lint Your Code:**
   Run `make lint`. This command checks your code for stylistic errors using flake8 and black, ensuring code quality and consistency.

9.  **Run All Tests:**
    Run `make test_all`. This command runs all tests in the project using pytest.

10. **Run Pre-commit on All Files:**
    Run `make precommit`. This command runs the pre-commit checks on all files in the project.