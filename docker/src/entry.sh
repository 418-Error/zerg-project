#!/bin/bash
set -e

/run/nginx.sh
/run/create_disk.sh
/run/install.sh
/run/launch.sh
