#!/bin/bash

# stop the incus service
systemctl stop incus

# Uninstall package dependencies
bash ~/incus/cleanup/uninstall.sh

# Remove incus source file
rm /etc/apt/sources.list.d/zabbly-incus-stable.sources

# Remove zabbly repo fingerprint
rm -rf /etc/apt/keyrings/zabbly.asc

# Update package list
apt-get update

# remove the incus folder from /var/lib
rm -rf /var/lib/incus

echo "Incus and related components have been uninstalled."