#!/bin/bash

app_name='Zoom Rooms'
app_url='https://zoom.us/client/latest/ZoomRooms.pkg'
app_pkg="/tmp/$app_name.pkg"

# Extract the version number from the file name
echo "Fetching latest version number of '$app_name' from '$app_url'..."
latest_version=$(curl -LsI "$app_url" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | tail -n1)
echo "Latest version number of $app_name is $latest_version."

# Check if the latest version of the Zoom Rooms app is already installed
if ls /Applications | grep -qi "ZoomPresence.app"; then
    installed_version=$(defaults read "/Applications/ZoomPresence.app/Contents/Info.plist" CFBundleShortVersionString | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')
#   installed_version='x.x.x' # for testing
    echo "$app_name $installed_version is installed."
    if [ "$installed_version" == "$latest_version" ]; then
        echo "The latest $app_name $latest_version is already installed."
        exit 0
    fi
else
    echo "'$app_name' is not installed."
fi

# Download the latest version of the Zoom Rooms app
echo "Downloading and installing the latest version of '$app_name'..."
curl -L -o "$app_pkg" "$app_url"

# Install the latest version of the Zoom Rooms app
sudo installer -pkg "$app_pkg" -target /

# Clean up
echo "Cleaning up..."
rm -fr "$app_pkg"

echo "Update completed successfully."

exit
