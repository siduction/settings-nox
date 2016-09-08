#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control nox
debian_rules

# nox
# ===
[ -d nox ]  && rm -r nox
cp -a templates/nox .

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/nox-livesettings.lintian-overrides \
    > debian/${CODENAME_SAFE}-nox-livesettings.lintian-overrides
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/nox-livesettings.preinst \
    > debian/${CODENAME_SAFE}-nox-livesettings.preinst
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/nox-livesettings.install \
    > debian/${CODENAME_SAFE}-nox-livesettings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/nox-livesettings.service \
    > debian/${CODENAME_SAFE}-nox-livesettings.service

sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/nox-settings.install \
    > debian/${CODENAME_SAFE}-nox-settings.install
sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/nox-settings.postinst \
    > debian/${CODENAME_SAFE}-nox-settings.postinst


grub_template nox


exit 0
