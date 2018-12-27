export KERNEL_SRC=$PWD
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-

cd ./linux

make distclean
make defconfig
make -j 16 dtbs modules Image

make INSTALL_MOD_PATH=./modules modules_install
