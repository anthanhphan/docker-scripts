#!/bin/bash

# Script to download and install Debezium JDBC and PostgreSQL connectors

# Variables
PLUGIN_VERSION="3.0.4.Final"
BASE_URL="https://repo1.maven.org/maven2/io/debezium"
JDBC_PLUGIN_URL="${BASE_URL}/debezium-connector-jdbc/${PLUGIN_VERSION}/debezium-connector-jdbc-${PLUGIN_VERSION}-plugin.tar.gz"
POSTGRES_PLUGIN_URL="${BASE_URL}/debezium-connector-postgres/${PLUGIN_VERSION}/debezium-connector-postgres-${PLUGIN_VERSION}-plugin.tar.gz"
PLUGIN_DIR="plugins"

# Create the plugins directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# Function to download and extract a plugin
download_and_extract() {
    local url=$1
    local plugin_name=$2

    echo "Downloading ${plugin_name} Connector version $PLUGIN_VERSION..."
    curl -L "$url" | tar -xz -C "$PLUGIN_DIR"

    # Check if the extraction was successful
    if [ $? -eq 0 ]; then
        echo "${plugin_name} Connector $PLUGIN_VERSION installed successfully in $PLUGIN_DIR."
    else
        echo "Failed to download or extract the ${plugin_name} Connector. Please check the URL and try again."
        exit 1
    fi
}

# Download and install the JDBC connector
download_and_extract "$JDBC_PLUGIN_URL" "JDBC"

# Download and install the PostgreSQL connector
download_and_extract "$POSTGRES_PLUGIN_URL" "PostgreSQL"

echo "All connectors installed successfully."
