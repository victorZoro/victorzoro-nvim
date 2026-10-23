#!/usr/bin/env bash
set -u

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

if [[ "$(uname -s)" == "Darwin" ]]; then
	command -v brew >/dev/null || { echo "Instale o Homebrew: https://brew.sh"; exit 1; }
	brew update
	brew install fd ripgrep neovim lazygit tree-sitter-cli python node
	brew install --cask iterm2 2>/dev/null || true
else
	# Linux dependencies
	sudo apt update
	sudo apt install -y fd-find xclip python3-pip ripgrep neovim curl tar

	# Install the latest lazygit release when the package is unavailable.
	if ! command -v lazygit >/dev/null; then
		LAZYGIT_VERSION=$(curl -fsSL "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
		curl -fsSLo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
		tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
		sudo install /tmp/lazygit /usr/local/bin/
	fi
fi

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
