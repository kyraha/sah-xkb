#!/bin/bash
set -e
set -o pipefail
set -u

# This script installs the project locally in the user's home directory.

# Determine the script's directory and sanity check for HOME
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if ! [ -n "${HOME:-}" -a -d "${HOME:-}" ]; then
    echo "Error: Cannot install if there's no HOME directory." >&2
    exit 1
fi

# Define the installation directory
XKB_DIR="xkb"
if [ -v XDG_CONFIG_HOME -a -d "${XDG_CONFIG_HOME:-}" ]; then
    CONFIG_DIR="${XDG_CONFIG_HOME}/${XKB_DIR}"
else
    CONFIG_DIR="${HOME}/.config/${XKB_DIR}"
fi

# Check if the files already exist to avoid overwriting
if [ -e "${CONFIG_DIR}/rules/evdev.xml" ]; then
    echo "Error: evdev.xml already exists in ${CONFIG_DIR}/rules/" >&2
    echo "You may want to try the manual installation instructions in the README" >&2
    exit 1
fi
if [ -e "${CONFIG_DIR}/symbols/sakha" ]; then
    echo "Error: file sakha already exists in ${CONFIG_DIR}/symbols/" >&2
    echo "You may want to try the manual installation instructions in the README" >&2
    exit 1
fi

echo "Installing to ${CONFIG_DIR}"
mkdir -p "${CONFIG_DIR}"

# Copy the necessary files to the user's config directory
cp --recursive --update=none-fail ${SCRIPT_DIR}/rules ${CONFIG_DIR}/
cp --recursive --update=none-fail ${SCRIPT_DIR}/symbols ${CONFIG_DIR}/

# Update the XKB configuration to include the new layout
echo "Installation complete. You may need to log out and log back in for changes to take effect."
echo "To use the new keyboard layout, you can select it in your system settings."
echo "Look for 'Sakha' in the keyboard layout options."
