#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control cinnamon
debian_rules

# cinnamon
# ============
[ -d cinnamon ] && rm -r cinnamon
cp -a templates/cinnamon .


sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-livesettings.install \
    > debian/${CODENAME_SAFE}-cinnamon-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-cinnamon-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-livesettings.preinst \
    > debian/${CODENAME_SAFE}-cinnamon-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-livesettings.service \
    > debian/${CODENAME_SAFE}-cinnamon-livesettings.service
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-settings.install \
    > debian/${CODENAME_SAFE}-cinnamon-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-settings.postinst \
    > debian/${CODENAME_SAFE}-cinnamon-settings.postinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/cinnamon-livesettings.postinst \
    > debian/${CODENAME_SAFE}-cinnamon-livesettings.postinst

sed -e "s/\@BACKGROUND_RENDERING_OPTION\@/${BACKGROUND_RENDERING_OPTION}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/cinnamon/schemas/installed/91_org.cinnamon.desktop.background.gschema.override \
    > cinnamon/schemas/installed/91_org.cinnamon.desktop.background.gschema.override
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/cinnamon/automount-open.desktop \
    > cinnamon/automount-open.desktop
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/cinnamon/cinnamon-background-properties/siduction.xml \
    > cinnamon/cinnamon-background-properties/siduction.xml

grub_template cinnamon


exit 0
