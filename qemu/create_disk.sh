#!/bin/bash

# Create a disk image with a single partition

set -e

qemu-img create -f raw disk.img 10G
