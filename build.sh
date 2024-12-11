#!/bin/bash

#$1 is the url to the image to pull

# if $1 isnt present, exit wiht an error
if [ -z "$1" ]; then
    echo "Error: No image provided to build. expected url to a bootc image in a container registry, such as quay.io/fedora/fedora-bootc:40."
    exit 1
fi

podman pull --arch arm64 "$1"

# sudo podman build --platform linux/arm64 -t "$1" .

# --partition-table-variant rpi is custom and likely wont be merged into upstream bib
podman run --rm -it --privileged --pull=newer --security-opt label=type:unconfined_t -v /config.toml:/config.toml:ro -v /output:/output ghcr.io/moralcode/bootc-image-builder:tutorial --type raw --target-arch aarch64 --rootfs ext4 --partition-table-variant rpi --local "$1"
