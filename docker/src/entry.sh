#!/bin/bash
set -e

/run/vnc.sh
/run/create_disk.sh
/run/install.sh
/run/launch.sh
