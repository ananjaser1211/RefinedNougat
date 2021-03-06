#!/bin/bash
# Cronos Kernel for Exynos 5433
# Coded by Ananjaser1211/BlackMesa
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software

# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Kernel Variables
CR_VERSION=V0.1
CR_DATE=$(date +%Y%m%d)
CR_TC=/home/elite/android/toolchain/arm-eabi-4.8/bin/arm-eabi-
CR_DIR=$(pwd)
CR_OUT=$CR_DIR/Helios/out
CR_DTS=arch/arm/boot/dts
CR_JOBS=5
CR_AIK=$CR_DIR/Helios/AIK-Linux
CR_RAMDISK=$CR_DIR/Helios/Ramdisk
CR_KERNEL=$CR_DIR/arch/arm/boot/zImage
CR_DTB=$CR_DIR/boot.img-dtb
# Device specific Variables
CR_DTSFILES="exynos5433-tre_eur_open_07.dtb exynos5433-tre_eur_open_08.dtb exynos5433-tre_eur_open_09.dtb exynos5433-tre_eur_open_10.dtb exynos5433-tre_eur_open_12.dtb exynos5433-tre_eur_open_13.dtb exynos5433-tre_eur_open_14.dtb exynos5433-tre_eur_open_16.dtb"
CR_CONFG=trelte_00_defconfig
CR_VARIANT=N910C
CR_ANDROID=7
CR_ARCH=arm

#Init
export $CR_ARCH
export CROSS_COMPILE=$CR_TC
export ANDROID_MAJOR_VERSION=$CR_ANDROID
echo "----------------------------------------------"
# echo "Cleaning"
echo " "
# make clean
# make mrproper
# rm -r -f $CR_OUT/*
echo " "
echo "----------------------------------------------"
echo "Building zImage for $CR_VARIANT"
echo " "
export LOCALVERSION=-Helios_Kernel-$CR_VERSION-$CR_VARIANT-$CR_DATE
make  $CR_CONFG
make -j$CR_JOBS
echo " "
echo "----------------------------------------------"
echo "Building DTB for $CR_VARIANT"
echo " "
export $CR_ARCH
export CROSS_COMPILE=$CR_TC	
export ANDROID_MAJOR_VERSION=$CR_ANDROID
make  $CR_CONFG
make $CR_DTSFILES
./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $CR_DTS/
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb
du -k "./boot.img-dtb" | cut -f1 >sizT
sizT=$(head -n 1 sizT)
rm -rf sizT
echo "Combined DTB Size = $sizT Kb"
echo " "
echo "----------------------------------------------"
echo "Building Boot.img for $CR_VARIANT"
echo " "
cp -rf $CR_RAMDISK/* $CR_AIK
mv $CR_KERNEL $CR_AIK/split_img/boot.img-zImage
mv $CR_DTB $CR_AIK/split_img/boot.img-dtb
$CR_AIK/repackimg.sh
mv $CR_AIK/image-new.img $CR_OUT/Helios-$CR_VARIANT-$CR_VERSION-$CR_DATE.img
$CR_AIK/cleanup.sh
echo "----------------------------------------------"
echo "$CR_VARIANT Ready at $CR_OUT"
echo " "
