#!/bin/bash

# Refer: https://github.com/zabbly/incus

# Add zabbly repo fingerprint
curl -fsSL https://pkgs.zabbly.com/key.asc | gpg --show-keys --fingerprint

# Expected output:
# pub   rsa3072 2023-08-23 [SC] [expires: 2025-08-22]
#       4EFC 5906 96CB 15B8 7C73  A3AD 82CC 8797 C838 DCFD
# uid                      Zabbly Kernel Builds <info@zabbly.com>
# sub   rsa3072 2023-08-23 [E] [expires: 2025-08-22]

# Save the keys
mkdir -p /etc/apt/keyrings/
curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc

# Add incus source
sh -c 'cat <<EOF > /etc/apt/sources.list.d/zabbly-incus-stable.sources
Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/incus/stable
Suites: $(. /etc/os-release && echo ${VERSION_CODENAME})
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/zabbly.asc

EOF'
