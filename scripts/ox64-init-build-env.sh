#!/bin/bash

write_site_conf ()
{
  # when called currend working directory is already the build directory
  if [ -d conf ] && [ ! -f conf/site.conf ]; then
      local SITECONF=""
      # write site.conf only if it does not exist
      # i.e. never ever modify if it exists or the conf directory does not exist
      if [ -f ../site.conf.sample ]; then
        SITECONF="../site.conf.sample"
      fi
      if [ -f ../site.conf ]; then
        SITECONF="../site.conf"
      fi
      if [ -n ${SITECONF} ]; then
        printf "\n Update site.conf - from sample in project root\n"
        cp $SITECONF conf/site.conf
        local NCPU=$(grep -c processor /proc/cpuinfo)
        echo "BB_NUMBER_THREADS = \"${NCPU}\" " >> conf/site.conf
        echo "PARALLEL_MAKE = \"-j ${NCPU}\" " >> conf/site.conf
      else
        echo "\n site.conf template not found, no site.conf established\n"
      fi
    fi
}

# we are in project root
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
TEMPLATECONF="$(pwd)/sources/meta-ox64/conf/templates"
source sources/poky/oe-init-build-env
write_site_conf
unset TEMPLATECONF
