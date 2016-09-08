#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control xorg
debian_rules

# xorg
# ====
if $XORG; then
    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/xorg-settings.install \
        > debian/${CODENAME_SAFE}-xorg-settings.install
    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/xorg-settings.postinst \
        > debian/${CODENAME_SAFE}-xorg-settings.postinst
        sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
            -e "s/\@DISPLAY\@/${DISPLAY}/g" \
            templates/debian/xorg-livesettings.postinst \
            > debian/${CODENAME_SAFE}-xorg-livesettings.postinst
    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/xorg-settings.postrm \
        > debian/${CODENAME_SAFE}-xorg-settings.postrm

    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/xorg/etc/skel/fluxbox/lastwallpaper \
                > xorg/etc/skel/fluxbox/lastwallpaper
    cp -af templates/xorg/etc/skel/git* xorg/etc/skel/
fi

grub_template xorg

exit 0
