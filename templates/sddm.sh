#!/bin/bash
set -e


. templates/functions.sh

source_version_info
debian_changelog
cleanup_old_builds
debian_cleanup
debian_foo_basics
basic_control sddm
debian_rules

# sddm
# ==============
#[ -d sddm ] && rm -r sddm
#cp -a templates/sddm .


sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@DISPLAY\@/${DISPLAY}/g" \
    templates/debian/sddm-livesettings.postrm \
    > debian/${CODENAME_SAFE}-sddm-livesettings.postrm


exit 0
