# Bash Script for Application Update

This Bash script is designed to automate the process of updating an application on macOS. It checks the latest version of the application, compares it with the installed version, and performs the update if necessary. The script also provides a user prompt to update the application if it is currently running.

## Features

- Fetches the latest version number of the application from a specified URL
- Checks if the application is already installed
- Compares the installed version with the latest version
- Prompts the user to update the application if it is running
- Downloads the latest version package
- Installs the latest version of the application
- Cleans up the downloaded package after installation

## Prerequisites

- macOS operating system
- Bash shell
- `curl` command
- `mdls` command
- `pgrep` command
- `osascript` command (AppleScript)

## Usage

1. Update the script variables in the beginning according to your application details:
   - `app_name`: The name of your application
   - `app_process_name`: The process name or identifier of your application
   - `app_url`: The URL where the latest version of the application can be downloaded
   - `logo_path`: The path to the logo file for displaying in the user prompt dialog

2. Make the script executable:
   ```bash
   chmod +x app_update_script.sh
