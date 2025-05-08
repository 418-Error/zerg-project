#!/bin/bash

qemu-system-i386 \
  -hda disk.img \
  -cdrom starcraft.iso \
  -cpu pentium3 \
  -m 512 \
  -vga cirrus \
  -usb \
  -device usb-tablet \
  -net nic,model=pcnet -net user
