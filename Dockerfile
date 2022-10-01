FROM python:3.9-bullseye

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY requirements.txt main.sh /app/

# Install packages from requirements.txt
RUN pip install -r requirements.txt
