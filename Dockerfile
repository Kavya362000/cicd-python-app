# Use official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy only requirements first for caching
COPY requirements.txt .

# Create virtual environment, activate it, and install dependencies
RUN python -m venv venv \
    && . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the rest of the project
COPY . .

# Set PATH to use the virtual environment by default
ENV PATH="/app/venv/bin:$PATH"

# Command to run your app
CMD ["python", "app.py"]
