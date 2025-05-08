#!/bin/bash
set -e

# verify that windows has not been installed yet

if [ -f /storage/windows ]; then
    echo "Windows has already been installed. Going to next step."
    exit 0
fi

# install windows

qemu-system-i386 \
  --enable-kvm \
  -hda /storage/disk.img \
  -cdrom $WIN_ISO \
  -display vnc=:0,websocket=5700 \
  -boot d \
  -cpu pentium3 \
  -m 512 \
  -vga std \
  -usb \
  -device usb-tablet \
  -net nic,model=pcnet -net user

echo "Windows installed. Going to next step."
echo "Windows installed. Going to next step." > /storage/windows
