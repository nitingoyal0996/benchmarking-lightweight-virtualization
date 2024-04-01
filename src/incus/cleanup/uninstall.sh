#!/bin/bash

# Remove incus source file
sudo rm /etc/apt/sources.list.d/zabbly-incus-stable.sources

# Remove zabbly repo fingerprint
sudo rm -rf /etc/apt/keyrings/zabbly.asc

# Update package list
sudo apt-get update

echo "Incus and related components have been uninstalled."