#Build script for N910C_NN

#!/bin/bash
DTS=arch/arm/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=/home/elite/android/toolchain/arm-eabi-4.8/bin/arm-eabi-
# Cleanup
make clean && make mrproper
# N910C_NN Config
make trelte_00_defconfig
make exynos5433-tre_eur_open_07.dtb
make exynos5433-tre_eur_open_08.dtb
make exynos5433-tre_eur_open_09.dtb
make exynos5433-tre_eur_open_10.dtb
make exynos5433-tre_eur_open_12.dtb
make exynos5433-tre_eur_open_13.dtb
make exynos5433-tre_eur_open_14.dtb
make exynos5433-tre_eur_open_16.dtb
# Make zImage
make ARCH=arm -j4
echo -n "Build dt.img......................................."

./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $DTS/
# get rid of the temps in dts directory
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb

# Calculate DTS size for all images and display on terminal output
du -k "./boot.img-dtb" | cut -f1 >sizT
sizT=$(head -n 1 sizT)
rm -rf sizT
echo "$sizT Kb"

echo "Remove Any files"
cd /home/elite/android/RefinedNougat/rf-tools/AIK-Linux

sudo ./cleanup.sh

echo "Copy Ramdisk"

sudo cp -a /home/elite/android/RefinedNougat/rf-tools/Unified/ramdisk/. /home/elite/android/RefinedNougat/rf-tools/AIK-Linux/ramdisk

echo "copy split-img"

sudo cp -a /home/elite/android/RefinedNougat/rf-tools/Unified/split_img/. /home/elite/android/RefinedNougat/rf-tools/AIK-Linux/split_img

echo "copy compiled zimage"

sudo cp /home/elite/android/RefinedNougat/arch/arm/boot/zImage /home/elite/android/RefinedNougat/rf-tools/AIK-Linux/split_img/boot.img-zImage

echo "copy compiled dtb"

sudo cp /home/elite/android/RefinedNougat/boot.img-dtb /home/elite/android/RefinedNougat/rf-tools/AIK-Linux/split_img/boot.img-dtb

echo "packing image"

sudo ./repackimg.sh

echo "Copy boot.img"

sudo cp /home/elite/android/RefinedNougat/rf-tools/AIK-Linux/image-new.img /home/elite/android/RefinedNougat/rf-tools/out/boot_N910C.img

echo "Cleanup after packing"

cd /home/elite/android/RefinedNougat/rf-tools/AIK-Linux

sudo ./cleanup.sh

rm /home/elite/android/RefinedNougat/boot.img-dtb

echo "boot.img saved to /rf-tools/out"

echo N910C Kernel Done