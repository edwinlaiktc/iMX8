#!/bin/bash

function usage() {
	echo "Usage : build_uboot [option]";
	echo "  -c    --config	Set config file.";
	echo "  -j    --jobs [N]	Allow N jobs at once; infinite jobs with no arg ";
	echo "  -h    --help		Print this message.";
	exit 0;
}


cfg="imx8mq_evk_defconfig"
job="12"

while [ "$1" != "" ]; do
      case "$1" in
          -c | --config )           	cfg="$2";        	shift;;
          -j | --jobs )       		job="$2";	     	shift;;
          -h | --help )                 usage		        exit;; # quit and show usage
          * )                           args+=("$1")             # if no match, add it to the positional args
      esac
      shift # move to next kv pair
done

echo "Start build uboot..."

if [ -z $cfg ]; then
	echo "Error: No kernel defined."
	exit 1;
fi

cd ./uboot

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

make distclean
make $cfg
make -j $job

echo "Done"
exit 0; 

