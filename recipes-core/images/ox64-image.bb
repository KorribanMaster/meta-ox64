SUMMARY = "Minimal image for ox64"
DESCRIPTION= "A small image just capable of allowing a device to boot."
LICENSE = "MIT"

inherit core-image image-buildinfo

DEPENDS:append = " zip-native"

IMAGE_INSTALL = "packagegroup-core-boot \
                packagegroup-core-full-cmdline \
                packagegroup-bflb-minimal \
                ${CORE_IMAGE_EXTRA_INSTALL} \
                "

IMAGE_LINGUAS = "en-us"
IMAGE_FEATURES:append = " \
    allow-root-login \
    ssh-server-dropbear \
    package-management"

export IMAGE_BASENAME = "ox64-image"
IMAGE_FSTYPES = "wic.bz2"

do_create_download() {
    install -m 0755 -d ${DEPLOY_DIR_IMAGE}/downloads/
    cd ${WORKDIR}
    rm -f ${IMAGE_NAME}.zip
    mkdir -p ${DISTRO}-${DISTRO_VERSION}
    ls ${DEPLOY_DIR_IMAGE}/bl808-firmware.bin ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}*${IMAGE_FSTYPES}
    cp -r ${DEPLOY_DIR_IMAGE}/bl808-firmware.bin ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}*${IMAGE_FSTYPES} ${DISTRO}-${DISTRO_VERSION}
    zip -r ${IMAGE_NAME}.zip ${DISTRO}-${DISTRO_VERSION}/*
    install -m 0755 ${IMAGE_NAME}.zip ${DEPLOY_DIR_IMAGE}/downloads/
}

addtask do_create_download after do_image_complete before do_populate_lic_deploy
