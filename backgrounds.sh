#!/bin/bash

# Define the destination directory for the clone and the target directory for the script
clone_directory="$HOME/Downloads/background"
script_target="/usr/local/bin"

# Check if the directory exists and is not empty
if [ -d "$clone_directory" ] && [ "$(ls -A $clone_directory)" ]; then
	echo "Directory exists and is not empty. Cloning skipped."
else
	# Clone the repository
	git clone git@github.com:REAPERali00/WallPaper.git "$clone_directory" &&
		echo "Repository cloned successfully."
fi

# Ensure the target directory for the script exists
mkdir -p "$script_target"

# Copy the Python script to the target directory using sudo for permissions
sudo cp "$clone_directory/setBackground.py" "$script_target" &&
	echo "Script copied successfully."

# Make the script executable using sudo for permissions
sudo chmod +x "$script_target/setBackground.py" &&
	echo "Script permissions set."
