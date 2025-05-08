#!/bin/bash

qemu-system-i386 \
  -hda disk.img \
  -cdrom en_windows_xp_professional_with_service_pack_3_x86_cd_x14-80428.iso \
  -boot d \
  -cpu pentium3 \
  -m 512 \
  -vga std \
  -net nic,model=pcnet -net user
