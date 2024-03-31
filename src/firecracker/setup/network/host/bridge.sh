#!/bin/bash

TAP_DEV='tap0'
BRIDGE='firecracker0'
echo "Enable bridge $BRIDGE"

# add a net bridge
ip link add "$BRIDGE" type bridge
ip link set "$BRIDGE" up
ip addr add 172.21.0.1/16 dev "$BRIDGE"

# connect tun/tap interfaces with bridge
iptables -t nat -A POSTROUTING -s 172.21.0.0/16 ! -o "$BRIDGE" -j MASQUERADE

# forward packets coming from subnet
iptables -I FORWARD 12 -i "$BRIDGE" ! -o "$BRIDGE" -j ACCEPT

echo "Completed $BRIDGE bridge setup" 

# add tap device on the host's bridge
ip tuntap add dev "$TAP_DEV" mode tap
brctl addif "$BRIDGE" "$TAP_DEV"
ip link set dev "$TAP_DEV" up

echo "Completed $TAP_DEV interface setup on $BRIDGE"