#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control lightdm
debian_rules

# lightdm
# ==============
[ -d lightdm ] && rm -r lightdm
cp -a templates/lightdm .


## GTK
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lightdm-gtk-settings.install \
    > debian/${CODENAME_SAFE}-lightdm-gtk-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lightdm-gtk-settings.postinst \
    > debian/${CODENAME_SAFE}-lightdm-gtk-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lightdm-gtk-settings.prerm \
    > debian/${CODENAME_SAFE}-lightdm-gtk-settings.prerm

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/lightdm/lightdm-gtk-greeter.conf \
    > lightdm/lightdm-gtk-greeter.conf

## KDE
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lightdm-kde-settings.install \
    > debian/${CODENAME_SAFE}-lightdm-kde-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lightdm-kde-settings.postinst \
    > debian/${CODENAME_SAFE}-lightdm-kde-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/lightdm-kde-settings.prerm \
    > debian/${CODENAME_SAFE}-lightdm-kde-settings.prerm
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/lightdm/lightdm-kde-greeter.conf \
    > lightdm/lightdm-kde-greeter.conf


exit 0
