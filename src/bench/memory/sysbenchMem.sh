#!/bin/bash

# Set parameters
TEST="memory"
MEMORY_BLOCK_SIZE="1M"
MEMORY_TOTAL_SIZE="500M"
NUM_THREADS=1

# Run sysbench with memory benchmark
sysbench --test=$TEST \
         --memory-block-size=$MEMORY_BLOCK_SIZE \
         --memory-total-size=$MEMORY_TOTAL_SIZE \
         --num-threads=$NUM_THREADS \
         run
