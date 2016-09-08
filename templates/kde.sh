#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control kde
debian_rules

# kde
# ===
[ -d kde ] && rm -r kde
cp -a templates/kde .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-livesettings.install \
    > debian/${CODENAME_SAFE}-kde-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-kde-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-livesettings.postinst \
    > debian/${CODENAME_SAFE}-kde-livesettings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-livesettings.preinst \
    > debian/${CODENAME_SAFE}-kde-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-livesettings.service \
    > debian/${CODENAME_SAFE}-kde-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-settings.install \
    > debian/${CODENAME_SAFE}-kde-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-settings.postinst \
    > debian/${CODENAME_SAFE}-kde-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/kde-livesettings.postinst \
    > debian/${CODENAME_SAFE}-kde-livesettings.postinst

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/kde/etc/kde4rc \
    > kde/etc/kde4rc

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/kde/etc/kde5rc \
    > kde/etc/kde5rc

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/kde/share/apps/desktoptheme/oxygen/metadata.desktop \
    > kde/share/apps/desktoptheme/oxygen/metadata.desktop

sed -e "s/\@DESCRIPTION\@/${DESCRIPTION}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/kde/share/config/kdeglobals \
    > kde/share/config/kdeglobals
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/kde/share/config/ksplashrc \
    > kde/share/config/ksplashrc


grub_template kde


exit 0
