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
 * Documents : [Uboot2015-Wiki](https://github.com/edwinlaiktc/iMX8/wiki)

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

### Complied uboot
To build uboot, just running script __build_uboot.sh__. <br>

```bash
# default platform is set as mx6_ktc_defconfig
./build_uboot.sh <your_platform_defconfig>
```

### Dump to SD Card
Also, running script __dd_uboot.sh__ to dump uboot to specific address of SD card. <br>
Default device name is "c", which fit to my usage, change it if needed.

```bash
# <X> will be device name of your sd card, ig. /dev/sdc => c
./dd_uboot.sh <X>
```

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
