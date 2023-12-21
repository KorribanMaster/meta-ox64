SUMMARY = "BFLB minimal packages"
DESCRIPTION = "Bouffalo Labs minimal required packages"
LICENSE = "MIT"
PR = "r0"

inherit packagegroup


RDEPENDS:${PN} = " \
    resize-rootfs \
    coreutils \
    net-tools \
    util-linux \
    mc \
    ca-certificates \
    u-boot \
    opensbi \
    bl808-firmware \
"
