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
   - busybox :[busybox](./busybox.tgz)
 * Documents : [iMX8-Wiki](https://github.com/edwinlaiktc/iMX8/wiki)

### Release Note
 * Current Modified Version : v1.0.0
 * Released Note : [[Released Note](CHANGELOG.md)]

### Uboot Compiler mapping table
| Version | Compiler | ARCH | Platform |
| ----------------- | ------------- | ----- | ------------- |
| imx_4.9.123 | GCC5.4.0 | arm | Ubuntu16.04LTS |

## Build your own UBoot
### 0. Requirements
```bash
sudo apt-get install gcc-aarch64-linux-gnu
```

### 1. [Build uboot](https://github.com/edwinlaiktc/iMX8/wiki/Build-UBoot)
To build uboot, just running script __build_uboot.sh__. <br>

```
Usage : build_uboot [option]
  -c    --config	Set config file.
  -j    --jobs [N]	Allow N jobs at once; infinite jobs with no arg 
  -h    --help		Print this message.
```

### 2. [Make mkimage](https://github.com/edwinlaiktc/iMX8/wiki/Make-mkimage)
iMX8 is pretty different with iMX6, and actually... not completed enough. <br>
With hybrid structure, bootloader of iMX8 including both uefi and uboot.<br>
Which make us have to build mkimage for booting up.<br><br>

### 3. [Copy Kernel](https://github.com/edwinlaiktc/iMX8/wiki/3.-Copy-Kernel)

 * Note: Make sure you already finished setting up SD card partition! Detail: [SD Card Setup](https://github.com/edwinlaiktc/iMX8/wiki/Setup-SD-Card-Partition)
Run __create_kernel.sh__, which clones the kernel source code and compile it automatically.<br>
Run __copy_kernel.sh__, which copies kernel Image and dtb to SD card.

### 4. [Dump Busybox](https://github.com/edwinlaiktc/iMX8/wiki/4.-Dump-Busybox)
Run __dump_busybox.sh__, which decompresses busybox.tgz and copy it to SD card.<br>

## Directory Hierarchy

```
iMX8
├── build_uboot.sh
├── busybox.tgz
├── CHANGELOG.md
├── copy_kernel.sh
├── create_kernel.sh
├── dump_bustbox.sh
├── firmware-imx-7.9.bin
├── Licenses
├── mkimage
├── mk_image.sh
├── README.md
├── uboot
└── util

```

## License
Disclaimer: Everything you see here are free for studying and none-profit usage.
Also make sure you comply with the [license](Licenses).

`Copyright © 2018, Kingston Technology Corp.`

`Developed by : RD Module | Edwin Lai & Sam Cheng`

[CodeAurora imx]: <https://source.codeaurora.org/external/imx/>
