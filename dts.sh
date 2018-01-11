# For manual generating only
#!/bin/bash
DTS=arch/arm/boot/dts
RDIR=$(pwd)
# UberTC
export CROSS_COMPILE=
make 
# Make DT.img
./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $DTS/ -s 2048
# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb