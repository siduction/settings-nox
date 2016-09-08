#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control gnome
debian_rules

# gnome
# =====
[ -d gnome ] && rm -r gnome
cp -a templates/gnome .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-livesettings.install \
    > debian/${CODENAME_SAFE}-gnome-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-gnome-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-livesettings.preinst \
    > debian/${CODENAME_SAFE}-gnome-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-livesettings.service \
    > debian/${CODENAME_SAFE}-gnome-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-settings.install \
    > debian/${CODENAME_SAFE}-gnome-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-settings.postinst \
    > debian/${CODENAME_SAFE}-gnome-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-livesettings.postinst \
    > debian/${CODENAME_SAFE}-gnome-livesettings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gnome-settings.prerm \
    > debian/${CODENAME_SAFE}-gnome-settings.prerm

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/gnome/automount-open.desktop \
    > gnome/automount-open.desktop
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/gnome/gnome-background-properties/siduction.xml \
    > gnome/gnome-background-properties/siduction.xml
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/gnome/schemas/installed/90_org.gnome.desktop.background.gschema.override \
    > gnome/schemas/installed/90_org.gnome.desktop.background.gschema.override
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/gnome/schemas/installed/90_org.gnome.desktop.screensaver.wallpaper.gschema.override \
    > gnome/schemas/installed/90_org.gnome.desktop.screensaver.wallpaper.gschema.override


grub_template gnome


exit 0
