#!/bin/bash

# remove vm socket
rm /tmp/firecracker.socket

# remove soft links from bin
bash ~/cleanup/uninstallcracker.sh

# remove network configs
bash ~/cleanup/removebridge.sh
