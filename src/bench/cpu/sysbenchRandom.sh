#!/bin/bash

# Set parameters
TEST="cpu"
CPU_MAX_PRIME=20000
NUM_THREADS=1

# Run sysbench
sysbench --test=$TEST \
         --cpu-max-prime=$CPU_MAX_PRIME \
         --num-threads=$NUM_THREADS \
         run
