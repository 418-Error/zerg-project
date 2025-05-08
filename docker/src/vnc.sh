#!/bin/bash

set -e

/root/noVNC/utils/novnc_proxy --vnc 127.0.0.1:5900 --listen 0.0.0.0:8006 &
