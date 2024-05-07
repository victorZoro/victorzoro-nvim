#!/bin/bash

# Function to install package and handle errors
install_package() {
	package_name=$1
	echo "Installing $package_name..."
	if sudo apt install -y $package_name; then
		echo "Successfully installed $package_name"
	else
		echo "Error installing $package_name"
		errors+=("$package_name")
	fi
}

# Array to store errors
errors=()

# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install packages
install_package "xclip"
install_package "python3-pip"
install_package "ripgrep"

# Add lazygit repository
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update

# Install lazygit
install_package "lazygit"

# Display errors
if [ ${#errors[@]} -ne 0 ]; then
	echo "Errors occurred during installation:"
	for error in "${errors[@]}"; do
		echo "- $error"
	done
fi
