#!/bin/bash

function usage() {
        echo "Usage : build_image [option]";
        echo "  -t    --target	Target device fs, eg. /dev/sdc1";
        echo "  -m    --mnt	Local mount point.";
	echo "  -d    --default	Default, ie. /dev/sdc1 & /mnt";
        echo "  -h    --help	Print this message.";
        exit 0;
}


device=""
mnt=""
default=true;

while [ "$1" != "" ]; do
      case "$1" in
          -t | --target )	device="$2";			shift;;
          -m | --mnt )		mnt="$2";			shift;;
	  -d | --default )	device="/dev/sdc2"; mnt="/mnt"  ;;
          -h | --help )		usage				exit;;	# quit and show usage
          * )			args+=("$1")		# if no match, add it to the positional args
      esac
      shift # move to next kv pair
done

if [ -z $device ]; then
	echo "No device set."
	exit 1;
fi

if [ -z $mnt ]; then
	echo "No mount point set."
	exit 1;
fi

sudo mount $device $mnt

cp -axR ./5_busybox/* $mnt

sudo umount $mnt
