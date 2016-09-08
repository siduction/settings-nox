#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control gdm3
debian_rules

# gdm3
# =======
[ -d gdm3 ] && rm -r gdm3
cp -a templates/gdm3 .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gdm3-settings.install \
    > debian/gdm3-settings-${CODENAME_SAFE}.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gdm3-settings.postinst \
    > debian/gdm3-settings-${CODENAME_SAFE}.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gdm3-settings.triggers \
    > debian/gdm3-settings-${CODENAME_SAFE}.triggers
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/gdm3-settings.prerm \
    > debian/gdm3-settings-${CODENAME_SAFE}.prerm
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/gdm3/10-gdm3-settings \
    > gdm3/10-gdm3-settings


exit 0
