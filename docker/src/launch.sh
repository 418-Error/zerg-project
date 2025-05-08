#!/bin/bash
set -e

# verify that windows has been installed
if [ ! -f /storage/windows ]; then
    echo "Windows has not been installed..."
    exit 1
fi

# launch windows + starcraft...

qemu-system-i386 \
  -hda /storage/disk.img \
  -cdrom $STARCRAFT_ISO \
  -cpu pentium3 \
  -m 512 \
  -display vnc=:0,websocket=5700 \
  -vga cirrus \
  -usb \
  -device usb-tablet \
  -net nic,model=pcnet -net user
