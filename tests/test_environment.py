import sys

REQUIRED_MAJOR = 3  # For Python 3


def test_python_version():
    system_major = sys.version_info.major
    # sourcery skip: no-conditionals-in-tests
    if system_major != REQUIRED_MAJOR:
        raise OSError(
            f"This project requires Python {REQUIRED_MAJOR}. Found: Python {sys.version}"
        )


# Call the function to perform the check
test_python_version()
