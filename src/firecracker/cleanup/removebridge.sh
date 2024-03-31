#!/bin/bash

TAP_DEV='tap0'
BRIDGE='firecracker0'

echo "Removing bridge $BRIDGE configuration..."

# Remove tap device from bridge
brctl delif "$BRIDGE" "$TAP_DEV"
ip link set dev "$TAP_DEV" down
ip tuntap del dev "$TAP_DEV" mode tap

# Remove bridge
ip link set "$BRIDGE" down
ip link delete "$BRIDGE" type bridge

# Remove iptables rules
iptables -t nat -D POSTROUTING -s 172.21.0.0/16 ! -o "$BRIDGE" -j MASQUERADE
iptables -D FORWARD -i "$BRIDGE" ! -o "$BRIDGE" -j ACCEPT

echo "Bridge $BRIDGE configuration has been removed."
