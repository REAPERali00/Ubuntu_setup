#!/bin/bash

# Stop execution on any error
set -e

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
fi

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install common utilities
echo "Installing common utilities..."
sudo apt install -y ncdu htop xclip nala curl gnome-tweaks gnome-shell-extensions

# Install Python3 and Pip
echo "Installing Python3 and pip..."
sudo apt install -y python3 python3-pip

# Installing speedtest from Ookla's repository
echo "Setting up Speedtest by Ookla..."
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt install -y speedtest

# Note: Installation of GNOME extensions not directly available via apt
echo "Please manually install GNOME Shell extensions via the GNOME Extensions website or GNOME Extensions app."

# Final message
echo "All requested packages and tools have been installed."

# My extentions:
# Blur My Shell
# Burn My Windows
# Clipboard Indicator
# Compiz Magic alike lamp effect
# Compiz windows effect
# Desktop cube
# User Themes
# Vitals
# Weather O'Clock
# Desktop Icons NG
# Ubuntu AppIndicators
# Ubuntu Dock
