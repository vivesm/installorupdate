#!/bin/bash

app_name='Zoom Rooms'
app_url='https://zoom.us/client/latest/ZoomRooms.pkg'
app_pkg="./ZoomRooms.pkg"
logo_path="/Users/Shared/cocollective-logo.png"

# Extract the version number from the file name
echo "Fetching latest version number of $app_name from $app_url..."
latest_version=$(curl -LsI "$app_url" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | tail -n1)
echo "Latest version number of $app_name is $latest_version."

# Check if the latest version of the Zoom Rooms app is already installed
if ls /Applications | grep -qi "ZoomPresence.app"; then
    echo "'$app_name' is installed."
    installed_version='5.1.0'
    echo "$app_name $installed_version is installed."
    if [ "$installed_version" == "$latest_version" ]; then
        echo "The latest version of $app_name ($latest_version) is already installed."
        exit 0
    fi
else
    echo "$app_name is not installed."
fi

# Prompt the user to update the app via the GUI
echo "A new version of $app_name is available. Do you want to update now?"

result=$(osascript -e 'tell app "System Events" to display dialog "A new version of '"$app_name"' is available. Do you want to update now?" buttons {"Later", "Update"} default button "Update" with icon file (POSIX file "'"$logo_path"'")')

if [ "$result" == "button returned:Update" ]; then
    # Install the latest version of the Zoom Rooms app
    sudo installer -pkg "$app_pkg" -target /
    echo "Update completed successfully."
else
    echo "Update cancelled by user."
fi

# Clean up
echo "Cleaning up..."
rm -fr "$app_pkg"

exit
