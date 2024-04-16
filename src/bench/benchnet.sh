#!/bin/bash

# Network Benchmark Script

# Measure Latency
echo "Measuring Latency..."
ping -c 5 google.com

# Measure Packet Loss
echo "Measuring Packet Loss..."
ping -c 100 -i 0.2 google.com | grep loss
