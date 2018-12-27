#!/bin/bash

function usage() {
        echo "Usage : create_kernel [option]";
        echo "  -b      --branch        Branch of imx linux kernel.";
        echo "  -j      --job [N]	Local mount point.";
        echo "  -h      --help          Print this message.";
        exit 0;
}


branch="mx_4.9.123_imx8mm_ga"
job="16"

while [ "$1" != "" ]; do
      case "$1" in
          -b | --branch )       branch="$2";                    shift;;
          -j | --job )          job="$2";                       shift;;
          -h | --help )         usage                           exit;;  # quit and show usage
          * )                   args+=("$1")            # if no match, add it to the positional args
      esac
      shift # move to next kv pair
done

echo "Clone linux kernel source code..."
git clone https://source.codeaurora.org/external/imx/linux-imx 
mv linux-imx linux
cd ./linux
git checkout $branch
echo "Now in branch $branch"


export KERNEL_SRC=$PWD
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

make distclean
make defconfig
make -j 16 dtbs modules Image

make INSTALL_MOD_PATH=./modules modules_install
