#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source "${SCRIPT_DIR}/modules/check-installed.sh"
source "${SCRIPT_DIR}/modules/nvm-source.sh"

check_env_file() {
  FILE_PATH="./infra/local/postgres/.env"

  if [ -f "$FILE_PATH" ]; then
    echo "The file $FILE_PATH exists."
  else
    echo "Error: The file $FILE_PATH does not exist." >&2
  fi
}

check_gnu_make_installed() {
  if is_gnu_make_installed; then
    echo "GNU Make is installed."
  else
    echo "Error: GNU Make is not installed." >&2
  fi
}

check_pnpm_installed() {
  if is_pnpm_installed; then
    echo "PNPM is installed."
  else
    echo "Error: PNPM is not installed." >&2
  fi
}

check_nvm_installed() {
  # Now that nvm is potentially sourced, 'nvm' should be a shell function.
  if is_nvm_installed; then
    echo "Node Version Manager (NVM) is installed and sourced."
  else
    echo "Error: Node Version Manager (NVM) is not installed or could not be sourced." >&2
  fi
}

check_node_installed() {
  if is_node_installed; then
    echo "Node.js is installed."
  else
    echo "Error: Node.js is not installed." >&2
  fi
}

source_nvm

# Run all checks
check_env_file
check_gnu_make_installed
check_pnpm_installed
check_nvm_installed
check_node_installed
