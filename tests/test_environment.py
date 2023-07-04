import sys

REQUIRED_PYTHON = "python3"


def test_python_version():
    system_major = sys.version_info.major
    # sourcery skip: no-conditionals-in-tests
    if REQUIRED_PYTHON == "python":
        required_major = 2
    elif REQUIRED_PYTHON == "python3":
        required_major = 3
    else:
        raise ValueError(f"Unrecognized python interpreter: {REQUIRED_PYTHON}")

    assert (
        system_major == required_major
    ), f"This project requires Python {required_major}. Found: Python {sys.version}"
