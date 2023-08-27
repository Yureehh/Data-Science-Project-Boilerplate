# Use an official Python image as the base for Python-specific operations
FROM python:3.11

# Environment variables: Ensures Python logs and other output are immediately flushed to the terminal
ENV PYTHONUNBUFFERED=1

# Sets the working directory inside the container for all subsequent instructions
WORKDIR /app

# Only copy the requirements file and install dependencies, improving caching and build speed
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project code into the container
# Note: Any files you wish to exclude should be specified in a .dockerignore file
COPY . /app/

# Optional: Run unit tests to validate the build
RUN make test_env

# Optional: Expose port for applications that have a web interface (Uncomment if needed)
# EXPOSE 8000

# Define the default command to run when the container starts
# Change this to fit the main entry point of your project
# CMD ["python", "your_main_script.py"]
#The CMD instruction specifies the default command to execute when the container starts.
#This could be a data pipeline script, Jupyter Notebook server, or web app.
#For example, if your main script is main.py, set CMD ["python", "main.py"].
