#!/bin/bash

set -eu

echo "Starting Cleanup"
install_dir=/firecracker
bin_dir=/usr/local/bin

# Check if Firecracker is installed
sudo rm -rf /firecracker
echo "Firecracker folder has been removed."

# Remove symbolic links and installed files
echo "Removing Firecracker..."
sudo rm -f "${bin_dir}/firecracker"
sudo rm -f "${bin_dir}/jailer"
sudo rm -f "${bin_dir}/firecracker-*"
sudo rm -f "${bin_dir}/jailer-*"

echo "Firecracker has been uninstalled successfully."
