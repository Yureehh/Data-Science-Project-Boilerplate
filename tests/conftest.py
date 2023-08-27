import os

import pytest


# Sample fixture
@pytest.fixture(scope="session")
def sample_fixture():
    """
    A session-scoped fixture that returns a string.
    This fixture will be initialized only once per test session and can be used across multiple test files.
    """
    return "I am a sample fixture"


# Fixture to set up a temporary environment variable
@pytest.fixture(scope="function")
def set_temp_env_var():
    """
    A function-scoped fixture that temporarily sets an environment variable and then deletes it after the test
    function that uses it has completed.
    """
    os.environ["TEMP_VAR"] = "temporary_value"
    yield
    del os.environ["TEMP_VAR"]
