#!/bin/bash

# if $1 isnt present, exit wiht an error
if [ -z "$1" ]; then
    echo "Error: No image provided to build. expected url to a bootc image in a container registry, such as quay.io/fedora/fedora-bootc:40."
    exit 1
fi

sudo podman build -t bootc-builder .

mkdir -p output
# check if config.toml exists and warn if it doesn't
if [ ! -f config.toml ]; then
    echo "Warning: config.toml not found. Please create one from the sample."
fi

sudo podman run --rm --privileged -v $(pwd)/output:/output -v $(pwd)/config.toml:/config.toml bootc-builder $1


