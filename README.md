<div align="center">
  <h1>iMX8MQ evk Board</h1>
</div>

<br>

<div align="center">
	This is the source code from [CodeAurora imx].
	<br>Modified by Edwin, for customer LPDDR4 platform, built with iMX8 series controller.
	<br>With SD card & emmc, and output with Rs232 & HDMI.
</div>

<br>

<div align="center">
  <a href="https://www.nxp.com/products/processors-and-microcontrollers/arm-based-processors-and-mcus/i.mx-applications-processors/i.mx-8-processors/i.mx-8m-family-armcortex-a53-cortex-m4-audio-voice-video:i.MX8M">
    <img src="https://img.shields.io/badge/arm64-iMX8-blue.svg" alt="Platform"/>
  </a>
  <a href="https://www.ubuntu.com/">
    <img src="https://img.shields.io/badge/ubuntu-14.04%20%7C%2016.04-brightgreen.svg" alt="OS"/>
  </a>
  <a href="https://gcc.gnu.org/">
    <img src="https://img.shields.io/badge/gcc-5.4-brightgreen.svg" alt="Compiler"/>
  </a>
</div>

<br>

    The program is provided AS IS with NO WARRANTY OF ANY KIND,
    INCLUDING THE WARRANTY OF DESIGN,
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

## Introductions 
 * Source() : 
   - uboot :[imx_v2017.03_4.9.123_imx8mm_ga](https://source.codeaurora.org/external/imx/uboot-imx)
   - mkimage :[imx_4.9.123_imx8mm_ga](https://source.codeaurora.org/external/imx/imx-mkimage)
   - kernel :[imx_4.9.123_imx8mm_ga](https://source.codeaurora.org/external/imx/linux-imx)
   - busybox :[busybox](5_busybox/)
 * Documents : [iMX8-Wiki](https://github.com/edwinlaiktc/iMX8/wiki)

### Release Note
 * Current Modified Version : v1.0.0
 * Modified Note : [[Modified Note](CHANGELOG.md)]

### Uboot Compiler mapping table
| Version | Compiler | ARCH | Platform |
| ----------------- | ------------- | ----- | ------------- |
| imx_4.9.123 | GCC5.4.0 | arm | Ubuntu16.04LTS |

## Build your own UBoot
### Requirements
```bash
sudo apt-get install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev
sudo apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi
sudo apt-get install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
sudo apt-get install gcc-aarch64-linux-gnu
```

### Clone all you need
Since file is too big to push... you have to clone from the Source above.<br>
```
git clone https://source.codeaurora.org/external/imx/uboot-imx
git checkout imx_v2017.03_4.9.123_imx8mm_ga
mv uboot-imx 1_uboot
git clone https://source.codeaurora.org/external/imx/imx-mkimage
git checkout imx_4.9.123_imx8mm_ga
mv imx-mkimage 3_mkimage
git clone https://source.codeaurora.org/external/imx/linux-imx
git checkout imx_4.9.123_imx8mm_ga
mv linux-imx 4_linux
```

### Build uboot
To build uboot, just running script __build_uboot.sh__. <br>
But make sure you copy the __ddr_init.c__ and __ddrphy_train.c__ to the folder refer to your platform. <br>
 * Hint : [Create DDR Training file]()
```bash
# default platform is set as imx8mq_evk_defconfig
./build_uboot.sh <your_platform_defconfig>
```

### Make mkimage
iMX8 is pretty different with iMX6, and actually... not completed enough. <br>
With hybrid structure, bootloader of iMX8 including both uefi and uboot.<br>
Which make us have to build mkimage for booting up.<br><br>

Also, run the script!
```bash
# Platform include iMX8M, iMX8QM, iMX8QX and iMX8dv. -J is used by "make"
./mk_image.sh -p <platform> -j <N>
```
 * Note: I already skip 2_atf(ARM Trusted Firmware), for detail please checkout [atf]().

### Copy Kernel
To build but kernel just run following command.
```bash
cd 4_linux
make defconfig
# make menuconfig => make any change u to fit your requirements
make -j 16
```
Then you can run my script!
```
# target = /dev/sdc1, mnt = place you want to mount, default is set as /mnt
./cp_Kernel -t <target> -m <mount_pt>
```
 * Note: Make sure you already finished setting up SD card partition! Detail: [SD Card Setup]()

### dump Busybox
Just copy busybox to SD card~
```
./dump_busybox -t <target> -m <mount_pt>
```
 * Note : SAME AS KERNEL. Detail: [SD Card Setup]()


## Directory Hierarchy

```
root
├── 1_uboot
├── 2_atf
├── 3_mkimage
├── 4_linux
├── 5_busybox
├── build_uboot.sh
├── cp_kernel.sh
├── dump_bustbox.sh
├── mk_image.sh
├── README.md
└── util

```

## License
Disclaimer: Everything you see here are free for studying and none-profit usage.
Also make sure you comply with the [license](Licenses).

`Copyright © 2018, Kingston Technology Corp.`

`Developed by : RD Module | Edwin Lai & Sam Cheng`

[CodeAurora imx]: <https://source.codeaurora.org/external/imx/>
