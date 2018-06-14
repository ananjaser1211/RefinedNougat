#!/bin/bash
#
# Cronos Build Script
# For Exynos7870
# Coded by BlackMesa/AnanJaser1211 @2018
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

# Directory Contol
CR_DIR=$(pwd)
CR_TC=/home/elite/android/toolchain/arm-eabi-4.8/bin/arm-eabi-
CR_DTS=arch/arm/boot/dts
CR_OUT=$CR_DIR/Helios/out
CR_AIK=$CR_DIR/Helios/AIK-Linux
CR_KERNEL=$CR_DIR/arch/arm/boot/zImage
CR_DTB=$CR_DIR/boot.img-dtb
# Kernel Variables
CR_VERSION=V1.2-NN
CR_NAME=Helios_Kernel
CR_JOBS=9
CR_ANDROID=7
#CR_PLATFORM=7.0.0
CR_ARCH=arm
CR_DATE=$(date +%Y%m%d)
# Init build
export CROSS_COMPILE=$CR_TC
export ANDROID_MAJOR_VERSION=$CR_ANDROID
#export PLATFORM_VERSION=$CR_PLATFORM
export $CR_ARCH
##########################################
# Device specific Variables [SM-N910C/H]
CR_DTSFILES_N910CH="exynos5433-tre_eur_open_07.dtb exynos5433-tre_eur_open_08.dtb exynos5433-tre_eur_open_09.dtb exynos5433-tre_eur_open_10.dtb exynos5433-tre_eur_open_12.dtb exynos5433-tre_eur_open_13.dtb exynos5433-tre_eur_open_14.dtb exynos5433-tre_eur_open_16.dtb"
CR_CONFG_N910CH=trelte_00_defconfig
CR_VARIANT_N910CH=N910C.H
CR_RAMDISK_N910CH=$CR_DIR/Helios/N910C
# Device specific Variables [SM-N910S/L/K]
CR_DTSFILES_N910SLK="exynos5433-trelte_kor_open_06.dtb exynos5433-trelte_kor_open_07.dtb exynos5433-trelte_kor_open_09.dtb exynos5433-trelte_kor_open_11.dtb exynos5433-trelte_kor_open_12.dtb"
CR_CONFG_N910SLK=trelteskt_defconfig
CR_VARIANT_N910SLK=N910S.L.K
CR_RAMDISK_N910SLK=$CR_DIR/Helios/N910S
##########################################

# Script functions
CLEAN_SOURCE()
{
echo "----------------------------------------------"
echo " "
echo "Cleaning"	
#make clean
#make mrproper
# rm -r -f $CR_OUT/*
rm -r -f $CR_DTB
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb	
echo " "
echo "----------------------------------------------"	
}
DIRTY_SOURCE()
{
echo "----------------------------------------------"
echo " "
echo "Cleaning"	
# make clean
# make mrproper
# rm -r -f $CR_OUT/*
rm -r -f $CR_DTB
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb	
echo " "
echo "----------------------------------------------"	
}
BUILD_ZIMAGE()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building zImage for $CR_VARIANT"	
	export LOCALVERSION=-$CR_NAME-$CR_VERSION-$CR_VARIANT-$CR_DATE
	make  $CR_CONFG
	make -j$CR_JOBS
	echo " "
	echo "----------------------------------------------"	
}
BUILD_DTB()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building DTB for $CR_VARIANT"	
	export $CR_ARCH
	export CROSS_COMPILE=$CR_TC
	export ANDROID_MAJOR_VERSION=$CR_ANDROID
	make  $CR_CONFG
	make $CR_DTSFILES
	./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $CR_DTS/
	du -k "./boot.img-dtb" | cut -f1 >sizT
	sizT=$(head -n 1 sizT)
	rm -rf sizT
	echo "Combined DTB Size = $sizT Kb"
	rm -rf $CR_DTS/.*.tmp
	rm -rf $CR_DTS/.*.cmd
	rm -rf $CR_DTS/*.dtb	
	echo " "
	echo "----------------------------------------------"
}
PACK_BOOT_IMG()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building Boot.img for $CR_VARIANT"
	cp -rf $CR_RAMDISK/* $CR_AIK
	mv $CR_KERNEL $CR_AIK/split_img/boot.img-zImage
	mv $CR_DTB $CR_AIK/split_img/boot.img-dtb
	$CR_AIK/repackimg.sh
	echo -n "SEANDROIDENFORCE" » $CR_AIK/image-new.img
	mv $CR_AIK/image-new.img $CR_OUT/$CR_NAME-$CR_VERSION-$CR_DATE-$CR_VARIANT.img
	$CR_AIK/cleanup.sh
}

# Main Menu
clear
echo "----------------------------------------------"
echo "$CR_NAME $CR_VERSION Build Script"
echo "----------------------------------------------"
PS3='Please select your option (1-3): '
menuvar=("SM-N910C-H" "SM-N910S-L-K" "Exit")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
        "SM-N910C-H")
            clear
            CLEAN_SOURCE
            echo "Starting $CR_VARIANT_N910CH kernel build..."
            CR_VARIANT=$CR_VARIANT_N910CH
            CR_CONFG=$CR_CONFG_N910CH
            CR_DTSFILES=$CR_DTSFILES_N910CH
			CR_RAMDISK=$CR_RAMDISK_N910CH
	    BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            echo " "
            echo "----------------------------------------------"
            echo "$CR_VARIANT kernel build finished."
            echo "$CR_VARIANT Ready at $CR_OUT"
            echo "Combined DTB Size = $sizT Kb"
            echo "Press Any key to end the script"
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;
        "SM-N910S-L-K")
            clear
            CLEAN_SOURCE
            echo "Starting $CR_VARIANT_N910SLK kernel build..."
            CR_VARIANT=$CR_VARIANT_N910SLK
       	    CR_CONFG=$CR_CONFG_N910SLK
            CR_DTSFILES=$CR_DTSFILES_N910SLK
			CR_RAMDISK=$CR_RAMDISK_N910SLK			
	    BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            echo " "
            echo "----------------------------------------------"
            echo "$CR_VARIANT kernel build finished."
            echo "$CR_VARIANT Ready at $CR_OUT"
            echo "Combined DTB Size = $sizT Kb"
	    echo "Press Any key to end the script"
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;
        "Exit")
            break
            ;;
        *) echo Invalid option.;;
    esac
done
