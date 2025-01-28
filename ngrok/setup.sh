#!/bin/bash

# This script installs and sets up ngrok automatically

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root (e.g. sudo)."
    exit 1
fi

# Install prerequisites (curl, unzip)
echo "Installing necessary dependencies..."
sudo apt update
sudo apt install -y curl unzip

# Download and instll ngrok
echo "Downloading ngrok..."
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

# Unzip the downloaded ngrok file
echo "Unzipping ngrok..."
sudo tar xvzf ./ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin

# Move ngrok to /usr/local/bin for global access
sudo mv ngrok /usr/local/bin/

# Clean up by removing the zip file
rm ngrok.zip

# Prompt user for ngrok authtoken (they need to sign up at https://ngrok.com/)
echo "Please visit https://ngrok.com/ and sign up for a free account if you haven't already."
echo "Once you're signed up, copy your auth token from the dashboard."
echo "Paste your auth token here: "
read AUTHTOKEN

# Set up ngrok with the provided auth token
echo "Setting up ngrok with your auth token..."
ngrok authtoken $AUTHTOKEN

# Verify ngrok installation
echo "ngrok installation and setup complete!"
ngrok version

echo "You can now use ngrok. Example: ngrok http 80"

