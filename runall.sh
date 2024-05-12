#!/bin/bash

# Stop execution on any error
set -e

# Function to check and set execute permissions
ensure_executable() {
	if [ ! -x "$1" ]; then
		echo "Setting execute permissions for $1"
		chmod +x "$1"
	fi
}

# Ensure scripts are executable
ensure_executable ./othertools.sh
ensure_executable ./tmux.sh
ensure_executable ./nvim.sh

# Execute scripts
echo "Running othertools.sh..."
./othertools.sh

echo "Running tmux.sh..."
./tmux.sh

echo "Running nvim.sh..."
./nvim.sh

echo "All scripts executed successfully."
