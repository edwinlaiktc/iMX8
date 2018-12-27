#!/bin/bash

# sudo apt-get install lib32z1 lib32ncurses5

function usage() {
	echo "Usage : mk_image [option]";
	echo "  -p    --platform	Set platform to make.";
        echo "  -c    --clean        	Clean all make files.";
	echo "  -d    --dump        	dump to sdcard.";
	echo "  -j    --job [N]	Allow N jobs at once; infinite jobs with no arg.";
	echo "  -h    --help		Print this message.";
	exit 0;
}

clean=false
platform=""
job="12"
target=""

while [ "$1" != "" ]; do
      case "$1" in
          -p | --platform )	platform="$2";		shift;;
          -c | --clean )     	clean=true;	        ;;
          -j | --job )       	job="$2";		shift;;
	  -t | --target )	target="$2";            shift;;
          -h | --help )		usage;			exit;; # quit and show usage
          * )			args+=("$1")             # if no match, add it to the positional args
      esac
      shift # move to next kv pair
done

if [ -z $platform ]; then
        echo "Error: No platform defined."
        exit 1;
fi

if [ "$clean" = true ]; then
	echo "Clear all file of $platform...";
	rm flash.bin
	cd ./mkimage/
	make clean SOC=$platform

	cd ./$platform
	rm mkimage_uboot
	rm fsl-imx8mq-evk.dtb
	rm u-boot-spl.bin
	rm u-boot-nodtb.bin
	rm `ls ../../util`
	echo "Done"
	ls
	exit 0;
fi

echo "Start build image..."

cp ./uboot/tools/mkimage 			./mkimage/$platform/mkimage_uboot
cp ./uboot/arch/arm/dts/fsl-imx8mq-evk.dtb 	./mkimage/$platform/

cp ./uboot/spl/u-boot-spl.bin 		./mkimage/$platform/
cp ./uboot/u-boot-nodtb.bin 		./mkimage/$platform/

cp ./util/bl31.bin 			./mkimage/$platform/
cp ./util/signed_hdmi_imx8m.bin		./mkimage/$platform/
cp ./util/lpddr4* 			./mkimage/$platform/

cd ./mkimage/
make -j $job SOC=$platform flash_hdmi_spl_uboot

cp ./$platform/flash.bin ../

echo "Make Done"

if [ -z $target ];then
	exit 0;
fi

echo "Start dump to SD card..."
echo "if=./$platform/flash.bin of=$target"
sudo dd if=./$platform/flash.bin of=$target bs=1k seek=33 status=progress && sync

echo "Dump SD card Done"
exit 0; 
 
