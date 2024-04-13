#!/bin/bash

# Set parameters
FILE_TOTAL_SIZE="10G"
NUM_THREADS=1

# Run sysbench with file I/O benchmark
sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqwr \
         --num-threads=$NUM_THREADS \
         prepare

sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqwr \
         --num-threads=$NUM_THREADS \
         run

sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqwr \
         --num-threads=$NUM_THREADS \
         cleanup
