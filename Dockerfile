# Use an official Python image as the base
FROM python:3.11

# Set up environment variables
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy only the files necessary for installing requirements
COPY requirements.txt /app/
# Optional: If you have different requirements for different environments
# COPY requirements.prod.txt /app/

# Install required packages using pip
RUN pip install --no-cache-dir -r requirements.txt
# Optional: For different environments
# RUN pip install --no-cache-dir -r requirements.prod.txt

# Copy the current directory contents into the container
# Use .dockerignore to exclude files
COPY . /app/

# Optional: Run tests
# RUN pytest

# Optional: Expose port if needed (e.g., for a web app)
# EXPOSE 8000

# Define the command to run the app
# CMD ["python", "your-app.py"]
