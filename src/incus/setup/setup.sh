#!/bin/bash

# add user as admint of the incus group
usermod -aG incus-admin ngoyal
newgrp incus-admin
echo "User ngoyal added as incus admin"

# install zfs utilities
apt install zfsutils-linux

# initialize incus
# Follow the instructions
# reboot the server - if zfs was not visible 
# select - enable server on the bridge - yes (default=no)
# and rerun this script
incus admin init
