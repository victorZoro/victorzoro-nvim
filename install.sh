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

# Function to install npm package and handle errors
npm_install() {
	package_name=$1
	echo "Installing $package_name..."
	if npm install -g $package_name; then
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
install_package "fd-find"
install_package "xclip"
install_package "python3-pip"
install_package "ripgrep"

# Add lazygit repository and install it
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin/

# install npm packages
npm_install "neovim"
npm_install "tree-sitter-cli"

# Display errors
if [ ${#errors[@]} -ne 0 ]; then
	echo "Errors occurred during installation:"
	for error in "${errors[@]}"; do
		echo "- $error"
	done
fi
