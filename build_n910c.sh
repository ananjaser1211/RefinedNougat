#Build script for N910C_NN

#!/bin/bash
DTS=arch/arm/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=
# Cleanup
make clean && make mrproper
# N910C_NN Config
make 
make 
# Make zImage
make ARCH=arm -j4
./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $DTS/ -s 2048
# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
# Generate Boot_N910c.img

echo "Remove Any files"
cd /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux

sudo ./cleanup.sh

echo "Copy Ramdisk"

sudo cp -a /home/elite/android/refinedkernel_2/rf-tools/Unified/ramdisk/. /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux/ramdisk

echo "copy split-img"

sudo cp -a /home/elite/android/refinedkernel_2/rf-tools/Unified/split_img/. /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux/split_img

echo "copy compiled zimage"

sudo cp /home/elite/android/refinedkernel_2/arch/arm/boot/zImage /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux/split_img/boot.img-zImage

echo "copy compiled dtb"

sudo cp /home/elite/android/refinedkernel_2/boot.img-dtb /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux/split_img/boot.img-dtb

echo "packing image"

sudo ./repackimg.sh

echo "Copy boot.img"

sudo cp /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux/image-new.img /home/elite/android/refinedkernel_2/rf-tools/out/boot_N910C.img

echo "Cleanup after packing"

cd /home/elite/android/refinedkernel_2/rf-tools/AIK-Linux

sudo ./cleanup.sh

rm /home/elite/android/refinedkernel_2/boot.img-dtb

echo "boot.img saved to /rf-tools/out"

echo N910C Kernel Done