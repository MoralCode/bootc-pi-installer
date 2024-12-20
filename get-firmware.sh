#!/bin/bash
RELEASE=40

mkdir -p ./tmp/efi/boot/efi
dnf install -y --downloadonly --release=$RELEASE --forcearch=aarch64 --destdir=./tmp/efi/ uboot-images-armv8 bcm283x-firmware bcm283x-overlays
for rpm in ./tmp/efi/*rpm; do rpm2cpio $rpm | cpio -idv -D ./tmp/efi/; done
mv ./tmp/efi/usr/share/uboot/rpi_arm64/u-boot.bin ./tmp/efi/boot/efi/rpi-u-boot.bin