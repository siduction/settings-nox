#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control mate
debian_rules

# mate
# ====
[ -d mate ] && rm -r mate
cp -a templates/mate .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-livesettings.install \
    > debian/${CODENAME_SAFE}-mate-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-mate-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-livesettings.preinst \
    > debian/${CODENAME_SAFE}-mate-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-livesettings.service \
    > debian/${CODENAME_SAFE}-mate-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-settings.install \
    > debian/${CODENAME_SAFE}-mate-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-settings.postinst \
    > debian/${CODENAME_SAFE}-mate-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/mate-livesettings.postinst \
    > debian/${CODENAME_SAFE}-mate-livesettings.postinst

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/mate/automount-open.desktop \
    > mate/automount-open.desktop
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/mate/mate-background-properties/siduction.xml \
    > mate/mate-background-properties/siduction.xml
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/mate/schemas/installed/org.mate.desktop.background.gschema.override \
    > mate/schemas/installed/org.mate.desktop.background.gschema.override
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/mate/schemas/installed/92_org.gnome.desktop.screensaver.wallpaper.gschema.override \
    > mate/schemas/installed/92_org.gnome.desktop.screensaver.wallpaper.gschema.override


grub_template mate


exit 0
