Getting Started
===============

The following steps will guide you through the process of setting up the project:

0. **Change the name and the description:**
   Search and replace all instances of Data-Science-Project-Boilerplate with the new name of your project. Also change the description of the project. This includes the README.md file, the Makefile, index.rst and the setup.py file.

1. **Mind the Terminal You're Using:**
   If you are on Linux or macOS, you can use the default terminal. If you are on Windows, you should use `Git Bash` instead of `cmd` or `PowerShell`. This is because `Git Bash` is a Unix-like terminal, which is required for some of the commands in the Makefile.

2. **Create a Python Environment:**
   Run `make create_environment`. This command creates a new Python environment for the project using either conda (if available) or virtualenv, isolating the project dependencies from other Python projects you might have on your system.

3. **Activate the Python Environment:**
   If conda was used to create the environment, activate it with `conda activate <project_name>`. If virtualenv was used, activate the environment with `workon <project_name>`. This activates the environment for use.

4. **Install Requirements & Pre-commit Hooks:**
   Run `make setup`. This command installs required packages and pre-commit hooks, which automatically check your code for common issues before commits.

5. **Process the Data:**
   Run `make data`. This command runs the `src/data/make_dataset.py` script to process your data.

6. **Store References:**
   Keep track of all the parameters and data used in the experiment. You can use the `references` folder to store your references.

7. **Develop Your Code:**
   The template stops with a common `make data` command, all the implementation part is up to you. You can add your own scripts to the `src` folder and create new commands, for example, `make features`, `make models`, `make visualization`. Store your models in the `src/models` folder and your visualizations in the `reports` or `reports/figures` folders.

8. **Create Notebooks:**
   After having created the pipeline, you can create notebooks to visualize the results. You can use the `notebooks` folder to store your notebooks. The suggested notebook naming convention is `[#]_[2-4 word description]_[DS-initials]_[ISO 8601 date].ipynb`. Remember, you can create a `make notebook` command to run the new notebook.

9. **Run Pre-commit on All Files:**
   Run `make precommit`. This command checks your code for stylistic errors using flake8, isort, and black, ensuring code quality and consistency. This command also runs all the pre-commit hooks to check for common issues.

10. **Clean Compiled Python Files:**
    Run `make clean`. This command deletes all compiled Python files, keeping your project directory clean.

11. **Run All Tests:**
    Run `make test_all`. This command runs all tests in the project using pytest.

12. **Commit Your Changes:**
    Run `make commit`. This command commits all your changes to the project repository. You can also use `git commit` directly.

13. **Push Your Changes:**
    Run `make push`. This command pushes all your changes to the project repository. You can also use `make commit` followed by `git push` if you want to commit and push separately.

14. **Generate Documentation:**
    Check the `docs` folder for more information on how to generate documentation for your project. In particular the `docs/conf.py` file contains the configuration for the documentation.
