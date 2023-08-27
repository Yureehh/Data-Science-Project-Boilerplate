import json
import logging
from pathlib import Path
from typing import Any, Dict


def setup_logger(name: str) -> logging.Logger:
    """
    Set up the logger based on the logger.json configuration file.

    Parameters:
        name (str): The name of the logger, usually __name__ for module-based loggers.

    Returns:
        logging.Logger: Configured logger object
    """

    # Load logger configuration from logger.json
    config_path: Path = Path("src/conf/logger.json")
    with open(config_path) as f:
        config: dict[str, Any] = json.load(f)

    # Assert the types
    assert isinstance(config["level"], str)
    assert isinstance(config["filename"], str)

    # Create logger with 'name'
    logger = logging.getLogger(name)

    # Set logger level based on configuration
    logger.setLevel(config["level"].upper())

    # Create handlers and set their levels
    fh = logging.FileHandler(config["filename"])
    fh.setLevel(config["level"].upper())

    ch = logging.StreamHandler()
    ch.setLevel(config["level"].upper())

    # Create formatter and add to handlers
    formatter = logging.Formatter(config["format"])
    fh.setFormatter(formatter)
    ch.setFormatter(formatter)

    # Add handlers to logger
    logger.addHandler(fh)
    logger.addHandler(ch)

    return logger


# Usage Example
if __name__ == "__main__":
    logger = setup_logger(__name__)
    logger.info("This is an info message.")
    logger.setLevel(logging.DEBUG)
    logger.debug("This is a debug message.")
    logger.setLevel(logging.INFO)
    logger.info("Back to info level.")
