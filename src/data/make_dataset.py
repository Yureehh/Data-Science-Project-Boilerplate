import os
from typing import Any

import click
from dotenv import find_dotenv, load_dotenv

# Import setup_logger from your utils package
from src.utils.logger import setup_logger

# Import the config module from your utils package
from src.utils import config

@click.command()
@click.argument("input_filepath", type=click.Path(exists=True))
@click.argument("interim_filepath", type=click.Path())
@click.argument("output_filepath", type=click.Path())
def main(input_filepath: str, interim_filepath: str, output_filepath: str) -> None:
    """Runs data processing scripts to turn raw data from (../raw) into
    cleaned data ready to be analyzed (saved in ../processed).
    """
    # Use the imported setup_logger function
    logger = setup_logger(__name__)
    logger.info("making final data set from raw data")


if __name__ == "__main__":
    # Use the value from the config module
    project_dir: Any = config.PROJECT_DIR
    load_dotenv(find_dotenv())
    main()