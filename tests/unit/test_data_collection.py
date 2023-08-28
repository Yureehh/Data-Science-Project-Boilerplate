import os


def test_data_directories_exist():
    assert os.path.exists("data/raw"), "'data/raw' directory not found"
    assert os.path.exists("data/processed"), "'data/processed' directory not found"
    assert os.path.exists("data/interim"), "'data/interim' directory not found"
