# Zoom Rooms Updater

This script automatically checks for updates for the Zoom Rooms application and installs them if necessary. It prompts the user for confirmation if the app is running; otherwise, it updates the application silently.

## Features

- Automatically checks for the latest Zoom Rooms version
- Compares the installed version with the latest version
- Prompts the user for confirmation if the app is running
- Updates the app silently if it's not running
- Time-out feature in the prompt for auto-update after 1 minute

## Requirements

- macOS with [Zoom Rooms](https://zoom.us/zoomrooms) installed
- Internet connection for downloading updates

## Usage

1. Save the script as `zoom_rooms_updater.sh` on your local machine.

2. Open Terminal.

3. Navigate to the directory where the script is saved:
   ```
   cd /path/to/script_directory
   ```

4. Grant execution permission to the script:
   ```
   chmod +x zoom_rooms_updater.sh
   ```

5. Run the script:
   ```
   ./zoom_rooms_updater.sh
   ```

   The script will then check for updates and perform the necessary actions.

## Customization

This script can be adapted for other applications by updating the following variables in the script:

- `app_name`: The display name of the application (e.g., 'Zoom Rooms')
- `app_process_name`: The process name of the application (e.g., 'ZoomPresence')
- `app_url`: The URL to download the latest version of the application package (e.g., 'https://zoom.us/client/latest/ZoomRooms.pkg')

Please ensure that the provided URL points to a valid package file for the respective application.

# Zoom Rooms Updater

This script automatically checks for updates for the Zoom Rooms application and installs them if necessary. It prompts the user for confirmation if the app is running; otherwise, it updates the application silently.

## Features

- Automatically checks for the latest Zoom Rooms version
- Compares the installed version with the latest version
- Prompts the user for confirmation if the app is running
- Updates the app silently if it's not running
- Time-out feature in the prompt for auto-update after 1 minute

## Requirements

- macOS with [Zoom Rooms](https://zoom.us/zoomrooms) installed
- Internet connection for downloading updates

## Usage

1. Save the script as `zoom_rooms_updater.sh` on your local machine.

2. Open Terminal.

3. Navigate to the directory where the script is saved:
   ```
   cd /path/to/script_directory
   ```

4. Grant execution permission to the script:
   ```
   chmod +x zoom_rooms_updater.sh
   ```

5. Run the script:
   ```
   ./zoom_rooms_updater.sh
   ```

   The script will then check for updates and perform the necessary actions.

## Customization

This script can be adapted for other applications by updating the following variables in the script:

- `app_name`: The display name of the application (e.g., 'Zoom Rooms')
- `app_process_name`: The process name of the application (e.g., 'ZoomPresence')
- `app_url`: The URL to download the latest version of the application package (e.g., 'https://zoom.us/client/latest/ZoomRooms.pkg')

Please ensure that the provided URL points to a valid package file for the respective application.
