#!/bin/bash

(
    # assign the vm an ip from the subnet of the bridge we created on host
ip addr add 172.21.0.2/16 dev eth0
ip link set eth0 up
ip route add default via 172.21.0.1 dev eth0

# add a nameserver to the vm (not sure why does this work)
echo "nameserver 8.8.8.8" > /etc/resolv.conf
)