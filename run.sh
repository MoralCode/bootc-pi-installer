#!/bin/bash

sudo podman build -t bootc-builder .

mkdir output
# check if config.toml exists and warn if it doesn't
if [! -f config.toml ]; then
    echo "Warning: config.toml not found. Please create one from the sample."
fi

sudo podman run --rm -v $(pwd)/output:/output -v $(pwd)/config.toml:/config.toml bootc-builder


