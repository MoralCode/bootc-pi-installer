# this is essentially the equivalent of a
FROM quay.io/fedora/fedora:41


RUN dnf -y install git podman qemu-user-static && dnf clean all

RUN podman pull pull ghcr.io/moralcode/bootc-image-builder:tutorial
RUN podman pull pull --arch arm64 quay.io/fedora/fedora-bootc:40

COPY build.sh /build.sh

CMD /build.sh