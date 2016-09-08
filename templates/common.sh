#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control common
debian_rules

# debian live settings common
# ===========================
[ -d common ] && rm -r common
cp -a templates/common .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-livesettings.install \
    > debian/${CODENAME_SAFE}-common-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-common-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-livesettings.postinst \
    > debian/${CODENAME_SAFE}-common-livesettings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-livesettings.preinst \
    > debian/${CODENAME_SAFE}-common-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-livesettings.service \
    > debian/${CODENAME_SAFE}-common-livesettings.service

# debian settings common
# ======================
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-settings.install \
    > debian/${CODENAME_SAFE}-common-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/common-settings.postinst \
    > debian/${CODENAME_SAFE}-common-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/common/livesettings \
    > common/livesettings
sed -e "s/\@FLL_LIVE_USER\@/${FLL_LIVE_USER}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/common/live/etc/polkit-1/localauthority/10-vendor.d/10-live-cd.pkla \
    > common/live/etc/polkit-1/localauthority/10-vendor.d/10-live-cd.pkla
sed -e "s/\@FLL_LIVE_USER\@/${FLL_LIVE_USER}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/common/live/etc/systemd/system/getty@tty1.service \
    > common/live/etc/systemd/system/getty@tty1.service


exit 0
