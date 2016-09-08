#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control xfce
debian_rules

# xfce
# ====
[ -d xfce ] && rm -r xfce
cp -a templates/xfce .


sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-livesettings.install \
    > debian/${CODENAME_SAFE}-xfce-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-xfce-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-livesettings.preinst \
    > debian/${CODENAME_SAFE}-xfce-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-livesettings.service \
    > debian/${CODENAME_SAFE}-xfce-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-settings.install \
    > debian/${CODENAME_SAFE}-xfce-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-settings.postinst \
    > debian/${CODENAME_SAFE}-xfce-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-livesettings.postinst \
    > debian/${CODENAME_SAFE}-xfce-livesettings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/xfce-settings.postrm \
    > debian/${CODENAME_SAFE}-xfce-settings.postrm

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/xfce/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml \
    > xfce/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/xfce/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml \
    > xfce/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml


grub_template xfce


exit 0
