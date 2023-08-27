import os


def test_something(sample_fixture):
    assert sample_fixture == "I am a sample fixture"


def test_temp_env_var(set_temp_env_var):
    assert os.environ.get("TEMP_VAR") == "temporary_value"
