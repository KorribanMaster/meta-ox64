#!/bin/bash
# Check we are in project root
if [ ! -d "$(pwd)/sources/meta-ox64" ]; then
  echo "ERROR: ./sources/meta-ox64 does not exist"
  echo "       This script should be invoked from yocto project root directory"
  echo "       Sourcing the script failed"
  return 1
fi
if [ ! -d "$(pwd)/sources/poky" ]; then
  echo "ERROR: ./sources/poky does not exist"
  echo "       This script should be invoked from yocto project root directory"
  echo "       Sourcing the script failed"
  return 1
fi
TEMPLATECONF="$(pwd)/sources/meta-ox64/templates"
source sources/poky/oe-init-build-env
unset TEMPLATECONF
