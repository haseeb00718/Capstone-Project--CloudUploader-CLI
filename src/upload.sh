#!/bin/bash

# Source credentials
source ./src/set_credentials.sh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file-to-upload> <container-name>"
    exit 1
fi

# Get file path and container name from command-line arguments
FILE_TO_UPLOAD=$1
CONTAINER_NAME=$2

# Check if the file exists
if [ ! -f "$FILE_TO_UPLOAD" ]; then
    echo "Error: File '$FILE_TO_UPLOAD' does not exist."
    exit 1
fi

# Create the container if it doesn't exist
echo "Creating container (if it doesn't exist)..."
az storage container create --name $CONTAINER_NAME --account-name $AZURE_STORAGE_ACCOUNT --account-key $AZURE_STORAGE_KEY --only-show-errors

# Upload the file to the specified container, with --overwrite flag
echo "Uploading file: '$FILE_TO_UPLOAD' to container: '$CONTAINER_NAME'"
az storage blob upload --container-name $CONTAINER_NAME --name $(basename "$FILE_TO_UPLOAD") --file "$FILE_TO_UPLOAD" --account-name $AZURE_STORAGE_ACCOUNT --account-key $AZURE_STORAGE_KEY --only-show-errors --overwrite

# Use `pv` for progress monitoring
pv "$FILE_TO_UPLOAD" | az storage blob upload --container-name $CONTAINER_NAME --name $(basename "$FILE_TO_UPLOAD") --file - --account-name $AZURE_STORAGE_ACCOUNT --account-key $AZURE_STORAGE_KEY --only-show-errors


# Check if the upload command succeeded
if [ $? -eq 0 ]; then
    echo "File uploaded successfully!"
else
    echo "Error: File upload failed."
    exit 1
fi
