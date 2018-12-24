#!/bin/ash
export PATH=$PATH:/Tools/

mkdir /dev/pts -p
mount -a

printf "Mount SD Card\r\n"
mount /dev/mmcblk0p1 /mnt
sleep 1

printf "===================\r\n"
printf "Welcome to K-Linux!\r\n"
printf "===================\r\n"

sleep 2

sync
