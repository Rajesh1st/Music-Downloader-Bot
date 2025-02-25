# © Cyril C Thomas
# https://t.me/cyril_c_10

# Use official Ubuntu latest image
FROM ubuntu:latest

# Set environment to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Create a working directory
RUN mkdir /Song_Downloader
WORKDIR /Song_Downloader

# Copy all files to container
COPY . ./

# Update system and install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip python3-venv ffmpeg

# Create & activate virtual environment
RUN python3 -m venv venv
RUN . venv/bin/activate

# Upgrade pip inside virtual environment
RUN venv/bin/pip install --upgrade pip

# Install required Python packages inside virtual environment
RUN venv/bin/pip install -r requirements.txt

# Start bot using virtual environment
CMD ["venv/bin/python", "bot.py"]
