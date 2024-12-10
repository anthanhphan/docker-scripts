#!/bin/bash

# Script to download and install the latest Debezium PostgreSQL connector

# Variables
PLUGIN_VERSION="3.0.4.Final"
PLUGIN_URL="https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${PLUGIN_VERSION}/debezium-connector-postgres-${PLUGIN_VERSION}-plugin.tar.gz"
PLUGIN_DIR="plugins"

# Create the plugins directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# Download and extract the plugin
echo "Downloading Debezium PostgreSQL Connector version $PLUGIN_VERSION..."
curl -L "$PLUGIN_URL" | tar -xz -C "$PLUGIN_DIR"

# Check if the extraction was successful
if [ $? -eq 0 ]; then
    echo "Debezium PostgreSQL Connector $PLUGIN_VERSION installed successfully in $PLUGIN_DIR."
else
    echo "Failed to download or extract the plugin. Please check the URL and try again."
    exit 1
fi