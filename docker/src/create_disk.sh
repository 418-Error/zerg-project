#!/bin/bash
set -e

# verify that the disk image doesn't already exist
if [ -f /storage/disk.img ]; then
    echo "Disk image already exists. Going to next step."
    exit 0
fi

qemu-img create -f raw /storage/disk.img 10G
