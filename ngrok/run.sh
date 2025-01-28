#!/bin/bash

# Ask user for port number
echo -n "Enter the port you want to expose (e.g., 8080): "
read PORT

# Ask user for the type of connection (http, tcp.)
echo -n "Enter the type of connection (http, tcp.): "
read CONNECTION_TYPE

# Ask user for the name of the tunnel (optional)
echo -n "Enter the name of the tunnel (optional, press Enter to skip): "
read TUNNEL_NAME

# Check if tunnel name is empty and set default if so
if [ -z "$TUNNEL_NAME" ]; then
  TUNNEL_NAME="default"
fi

# Display the input to the user for confirmation
echo "You are about to expose port $PORT using a $CONNECTION_TYPE tunnel named '$TUNNEL_NAME'."

# Launch ngrok with the provided settings
if [ "$CONNECTION_TYPE" == "http" ]; then
    echo "Launching ngrok on port $PORT using $CONNECTION_TYPE..."
    ngrok http $PORT
elif [ "$CONNECTION_TYPE" == "tcp" ]; then
    echo "Launching ngrok on port $PORT using $CONNECTION_TYPE..."
    ngrok tcp $PORT
else
    echo "Invalid connection type. Please use either 'http' or 'tcp'."
    exit 1
fi

