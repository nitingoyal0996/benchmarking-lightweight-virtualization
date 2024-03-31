#!/bin/bash

mkdir ""

ARCH="$(uname -m)"

# Resource locations
kernel_url="https://terraform-20231223074656017300000001.s3.amazonaws.com/kernels/vmlinux" 
filesystem_url="https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.8/${ARCH}/ubuntu-22.04.ext4"
rsa_url="https://s3.amazonaws.com/spec.ccfc.min/firecracker-ci/v1.8/${ARCH}/ubuntu-22.04.id_rsa"

# Directories
source_dir="$(pwd)"
target_dir="/firecracker/releases/release-v1.7.0-${ARCH}"

# Change directory to the source directory
cd "$source_dir" || { echo "Failed to change directory to $source_dir"; exit 1; }

# Download the file using wget
wget "$kernel_url"
wget "$filesystem_url"
wget "$rsa_url"

# Set user read permission on the ssh key
chmod 400 "$source_dir/ubuntu-22.04.id_rsa"

# Check if download was successful
if [ $? -ne 0 ]; then
    echo "Download failed. Exiting..."
    exit 1
fi

# Get the filename from the URL
kernel_name=$(basename "$kernel_url")
filesystem_name=$(basename "$filesystem_url")
rsa_url=$(basename "$rsa_url")

# Move the downloaded file to the target directory
mv "$kernel_name" "$target_dir"
mv "$filesystem_name" "$target_dir"
mv "$rsa_url" "$target_dir"

# Check if move was successful
if [ $? -eq 0 ]; then
    echo "File moved successfully to $target_dir"
else
    echo "Failed to move file to $target_dir"
fi