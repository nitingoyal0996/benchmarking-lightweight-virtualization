#!/bin/bash
# Set parameters
FILE_TOTAL_SIZE="250M"
NUM_THREADS=1

# Run sysbench with file I/O benchmark for read
sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqrd \
         --num-threads=$NUM_THREADS \
         prepare

sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqrd \
         --num-threads=$NUM_THREADS \
         run

sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqrd \
         --num-threads=$NUM_THREADS \
         cleanup

# Run sysbench with file I/O benchmark for write
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

# Run sysbench with file I/O benchmark for update
sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqrewr \
         --num-threads=$NUM_THREADS \
         prepare

sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqrewr \
         --num-threads=$NUM_THREADS \
         run

sysbench fileio \
         --file-total-size=$FILE_TOTAL_SIZE \
         --file-test-mode=seqrewr \
         --num-threads=$NUM_THREADS \
         cleanup
