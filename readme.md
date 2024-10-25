# CloudUploader CLI

## Project Overview
CloudUploader CLI is a command-line interface application designed to facilitate file uploads to Azure Blob Storage. This project aims to simplify the process of managing cloud storage by providing functionalities such as file uploads, progress tracking, and secure storage options.

## Features
- **File Uploading**: Upload files to specified containers in Azure Blob Storage.
- **Progress Indication**: Visual feedback during uploads using the `pv` (Pipe Viewer) tool.
- **File Synchronization**: Checks if a file already exists in the cloud, prompting the user to overwrite, skip, or rename the file.
- **Shareable Links**: Generate and display links for easy sharing after file uploads.
- **Encryption**: Optionally encrypt files before uploading for added security.

## Installation

### Prerequisites
- **Linux Subsystem for Windows (WSL)**: Ensure you have WSL installed on your Windows machine.
- **Azure CLI**: Install the Azure CLI for managing Azure resources.
- **pv**: Install `pv` for monitoring the progress of data through a pipe.

```bash
# Install pv on Ubuntu
sudo apt update
sudo apt install pv