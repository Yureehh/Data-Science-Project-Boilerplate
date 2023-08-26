import logging
import os
from logging import Logger
from pathlib import Path
from typing import Any

import click
from dotenv import find_dotenv, load_dotenv


def setup_logger() -> Logger:
    log_fmt = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    logging.basicConfig(level=logging.INFO, format=log_fmt)
    return logging.getLogger(__name__)


@click.command()
@click.argument("input_filepath", type=click.Path(exists=True))
@click.argument("output_filepath", type=click.Path())
def main(input_filepath: str, output_filepath: str) -> None:
    """Runs data processing scripts to turn raw data from (../raw) into
    cleaned data ready to be analyzed (saved in ../processed).
    """
    logger: Logger = setup_logger()
    logger.info("making final data set from raw data")


if __name__ == "__main__":
    project_dir: Any = os.getcwd()
    load_dotenv(find_dotenv())
    main()
