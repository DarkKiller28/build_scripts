
#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/HorizonV2/android.git -b lineage-22.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/DarkKiller28/local_manifests_mi439-clo .repo/local_manifests -b horizondroid-15-qpr2
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
lunch lineage_mi439-bp1a-userdebug

# Build
mka horizon
