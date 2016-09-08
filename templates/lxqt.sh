#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control lxqt
debian_rules

# lxqt
# ====
[ -d lxqt ] && rm -r lxqt
cp -a templates/lxqt .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-lxqt-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-livesettings.preinst \
    > debian/${CODENAME_SAFE}-lxqt-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-livesettings.install \
    > debian/${CODENAME_SAFE}-lxqt-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-livesettings.service \
    > debian/${CODENAME_SAFE}-lxqt-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-settings.install \
    > debian/${CODENAME_SAFE}-lxqt-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-settings.postinst \
    > debian/${CODENAME_SAFE}-lxqt-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lxqt-livesettings.postinst \
    > debian/${CODENAME_SAFE}-lxqt-livesettings.postinst

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/lxqt/etc/xdg/pcmanfm-qt/lxqt/settings.conf \
    > lxqt/etc/xdg/pcmanfm-qt/lxqt/settings.conf
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/lxqt/etc/xdg/lxqt/lxqt.conf \
    > lxqt/etc/xdg/lxqt/lxqt.conf


grub_template lxqt


exit 0
