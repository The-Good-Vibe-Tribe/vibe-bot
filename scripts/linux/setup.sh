#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "${SCRIPT_DIR}/modules/check-installed.sh"
source "${SCRIPT_DIR}/modules/nvm-source.sh"

# Function to install NVM (Node Version Manager)
install_nvm() {
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

  # Source NVM to make it available in the current shell
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  echo "NVM installed successfully."
}

# Function to install Node.js LTS
install_node_lts() {
  echo "Installing Node.js LTS..."
  nvm install --lts
  nvm use --lts
  echo "Node.js LTS installed and set as default."
}

# Function to install pnpm
install_pnpm() {
  echo "Installing pnpm..."
  npm install -g pnpm
  echo "pnpm installed successfully."
}

# Function to install GNU Make
install_make() {
  echo "Installing GNU Make..."
  if command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y make
  elif command -v yum &> /dev/null; then
    sudo yum install -y make
  elif command -v dnf &> /dev/null; then
    sudo dnf install -y make
  elif command -v pacman &> /dev/null; then
    sudo pacman -Sy --noconfirm make
  else
    echo "Error: Could not determine package manager to install GNU Make."
    echo "Please install GNU Make manually using your system's package manager."
    return 1
  fi
  echo "GNU Make installed successfully."
}

# Main script execution
echo "Starting installation process..."

source_nvm

if ! is_gnu_make_installed; then
    install_make
fi

if ! is_nvm_installed; then
    install_nvm
fi

if ! is_node_installed; then
    install_node_lts
fi

if ! is_pnpm_installed; then
    install_pnpm
fi

echo "Installation complete!"
echo "Please restart your terminal or run 'source ~/.bashrc' (or equivalent) to ensure all changes take effect."
