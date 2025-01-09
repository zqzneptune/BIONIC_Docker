#!/bin/bash

# Check if config file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path_to_config_file>"
    echo "Example: $0 /path/to/your/config.json"
    echo ""
    echo "Directory structure expected:"
    echo "YOUR_PROJECT_DIR/"
    echo "├── config.json     # Configuration file"
    echo "├── inputs/         # Input network files"
    echo "└── outputs/        # Output files will be saved here"
    exit 1
fi

CONFIG_FILE=$1
PROJECT_DIR=$(dirname "$CONFIG_FILE")

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file not found: $CONFIG_FILE"
    exit 1
fi

# Ensure inputs directory exists
if [ ! -d "$PROJECT_DIR/inputs" ]; then
    echo "Error: inputs directory not found in $PROJECT_DIR"
    echo "Please create an 'inputs' directory and place your network files there"
    exit 1
fi

# Create outputs directory if it doesn't exist
mkdir -p "$PROJECT_DIR/outputs"

echo "Using project structure:"
echo "Project root: $PROJECT_DIR"
echo "Config file: $CONFIG_FILE"
echo "Input dir:   $PROJECT_DIR/inputs"
echo "Output dir:  $PROJECT_DIR/outputs"
echo ""

# Run docker container with mounted volumes
docker run --gpus all \
    -v "$PROJECT_DIR":/data \
    -v "$PROJECT_DIR"/inputs:/inputs \
    -v "$PROJECT_DIR"/outputs:/outputs \
    bionic-model:0.2.6-cuda11.1-cudnn8-ubuntu20.04 \
    bionic /data/$(basename "$CONFIG_FILE")
