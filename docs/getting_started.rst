Getting_Started
===============

This guide walks you through setting up the Data-Science-Project-Boilerplate. Follow each step carefully to avoid issues.

Prerequisites
-------------

- Unix-like terminal (`Git Bash` for Windows users)
- Python >= 3.x installed
- (Optional) Docker installed
- Git installed

Initial Setup
-------------

0. **Rename Project**:
    Rename all instances of `Data-Science-Project-Boilerplate` to your project's name in README.md, Makefile, index.rst, and setup.py.

1. **Choose a Terminal**:
    Linux/macOS: default terminal
    Windows: use `Git Bash`

> **Failure Point**: Using `cmd` or `PowerShell` could cause Makefile commands to fail. Stick with `Git Bash`.

Environment Setup (Choose One)
------------------------------

2. **Docker Environment (Optional)**:
    If you prefer using Docker, follow these steps:
    ```bash
    docker build -t my_project .
    docker run -it my_project
    ```
    Skip to 'Project Configuration' if you choose Docker.

3. **Python Environment (If not using Docker)**:
    ```bash
    make create_environment
    ```

4. **Activate Environment (If not using Docker)**:
    - Conda: `conda activate <project_name>`
    - Virtualenv: `workon <project_name>`

> **Failure Point**: Ensure `conda` or `virtualenv` is installed. Check logs for errors.

Project Configuration
---------------------

5. **Install Dependencies (If not using Docker)**:
    ```bash
    make setup
    ```

6. **Data Processing**:
    ```bash
    make data
    ```

7. **Manage References**:
    Use the `references` folder for storing experiment metadata.

Development
-----------

8. **Coding**:
    Add your code in `src`. Use `make features`, `make models`, `make visualization` for different tasks.

9. **Jupyter Notebooks**:
    Create notebooks in the `notebooks` folder. Use the naming convention `[#]_[Description]_[Initials]_[Date].ipynb`.

Code Quality
------------

10. **Pre-commit Checks**:
    ```bash
    make precommit
    ```

11. **Cleanup**:
    ```bash
    make clean
    ```

12. **Run Tests**:
    ```bash
    make test_all
    ```

Version Control
---------------

13. **Commit Changes**:
    ```bash
    make commit
    ```

14. **Push Changes**:
    ```bash
    make push
    ```

Documentation
-------------

15. **Generate Docs**:
    Check `docs/conf.py` for documentation settings.

> **Failure Point**: Incorrectly configured `conf.py` can lead to incomplete documentation. Validate settings before generating docs.
