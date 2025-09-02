#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/DarkKiller28/local_manifests_Mi439 .repo/local_manifests -b a15-qpr2-axion
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Build Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# Have to add these flags in device.mk

# Export
export BUILD_USERNAME=DarkKiller28
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "============="

# Lunch
breakfast Mi439_4_19 va

# Build
mka bacon
