#!/bin/bash

# clear socket from previous VM run
rm /tmp/firecracker.socket

# run
firecracker --api-sock /tmp/firecracker.socket --config-file ~/init/configs/microvm.json
