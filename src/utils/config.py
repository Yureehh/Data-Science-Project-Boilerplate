import os
import sys

# Append the current working directory to the Python path
sys.path.append(os.getcwd())

# Define your project's configuration variables here
DATA_DIR = os.path.join(os.getcwd(), "src", "data")
MODELS_DIR = os.path.join(os.getcwd(), "src", "models")