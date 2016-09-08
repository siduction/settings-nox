#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control lxde
debian_rules

# lxde
# ====
[ -d lxde ] && rm -r lxde
cp -a templates/lxde .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-lxde-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-livesettings.preinst \
    > debian/${CODENAME_SAFE}-lxde-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-livesettings.install \
    > debian/${CODENAME_SAFE}-lxde-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-livesettings.service \
    > debian/${CODENAME_SAFE}-lxde-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-settings.install \
    > debian/${CODENAME_SAFE}-lxde-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-settings.postinst \
    > debian/${CODENAME_SAFE}-lxde-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxde-livesettings.postinst \
    > debian/${CODENAME_SAFE}-lxde-livesettings.postinst

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/lxde/etc/skel/config/pcmanfm/main.lxde \
    > lxde/etc/skel/config/pcmanfm/main.lxde


grub_template lxde


exit 0
