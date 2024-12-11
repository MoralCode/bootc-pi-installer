# bootc installer environment

this is an environment meant to make it easy to build bootci images for raspberry pi by including all of the various dependencies and workarounds necessary for bootci image builder to successfully output a disk image.


it is meant to accompany this blog post: TBD


## usage

`./run.sh <the bootc container you want to build an image for>`

## behavior

this script uses a Fedora 41 environment with all the correct dependencies and patches to run bootc-image-builder so that it can successfully create a raspberry pi compatible image. this image will be deposited in `./output`