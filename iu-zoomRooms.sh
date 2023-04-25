#!/bin/bash

app_name='Zoom Rooms'
app_process_name='ZoomPresence'
app_url='https://zoom.us/client/latest/ZoomRooms.pkg'
app_pkg="./${app_process_name}.pkg"
logo_path="/Users/Shared/cocollective-logo.png"

function display_dialog() {
    local message="$1"
    local button1="$2"
    local button2="$3"
    local timeout="$4"
    osascript -e "tell app \"System Events\" to display dialog \"$message\" buttons {\"$button1\", \"$button2\"} default button \"$button2\" with icon file (POSIX file \"$logo_path\") giving up after $timeout"
}

# Extract the version number from the file name
echo "Fetching latest version number of $app_name from $app_url..."
latest_version=$(curl -LsI "$app_url" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | tail -n1)
echo "Latest version number of $app_name is $latest_version."

# Check if the latest version of the app is already installed
if ls /Applications | grep -qi "${app_process_name}.app"; then
    echo "'$app_name' is installed."
    installed_version=$(mdls -name kMDItemVersion "/Applications/${app_process_name}.app" | awk '{print $3}')
    # installed_version='x.x.x' # manual override
    echo "$app_name $installed_version is installed."
    if [ "$(printf '%s\n' "$installed_version" "$latest_version" | sort -V | tail -n1)" == "$installed_version" ]; then
        echo "The latest version of $app_name ($latest_version) is already installed."
        exit 0
    fi
else
    echo "$app_name is not installed."
    exit 1
fi

# Check if the app is running
if pgrep -i "$app_process_name"; then
    echo "$app_name is currently running. Prompting user for update."
    # Prompt the user to update the app via the GUI
    result=$(display_dialog "A new version of $app_name is available. Do you want to update now?" "Later" "Update" 60)
    if [ "$result" == "button returned:Later" ]; then
        echo "Update cancelled by user."
        exit 1
    fi
else
    echo "$app_name is not running. Updating without prompt."
fi 

# Download the package
echo "Downloading $app_name package..."
if curl -L "$app_url" --progress-bar --output "$app_pkg"; then
    echo "Package downloaded successfully."
else
    echo "Failed to download the package."
    exit 1
fi

# Install the latest version of the app
sudo installer -pkg "$app_pkg" -target /
echo "Update completed successfully."

# Clean up
echo "Cleaning up..."
rm -fr "$app_pkg"

exit
