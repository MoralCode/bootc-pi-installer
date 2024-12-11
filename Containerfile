# this is essentially the equivalent of a
FROM quay.io/fedora/fedora:41


RUN dnf -y install git podman qemu-user-static && dnf clean all


COPY build.sh /build.sh

USER root

ENTRYPOINT ["/build.sh"]