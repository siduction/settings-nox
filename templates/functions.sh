#!/bin/bash

# source version info
function source_version_info {
    if [ -f VERSION ]; then
        . ./VERSION
    else
        echo "No VERSION-File, exit!"
        exit 1
    fi

    if [ -f FLAVOUR ]; then
        . ./FLAVOUR
    else
        echo "No FLAVOUR-File, exit!"
        exit 1
    fi

}


# eventually cleanup old builds
function cleanup_old_builds {
    if [ -f ./debian/rules ]; then
        debuild -d clean
        rm debian/rules
        echo "old builds cleaned up, run bootstrap again!"
        return 1
    fi
}


# debian cleanup
# ==============
function debian_cleanup {
    rm -vrf debian/siduction-live-settings-*-*
    rm -vrf debian/siduction-settings-*-*
    rm -vf debian/files
    rm -vf debian/*.init
    rm -vf debian/*.install
    rm -vf debian/*.lintian-overrides
    rm -vf debian/*.log
    rm -vf debian/*.postinst
    rm -vf debian/*.preinst
    rm -vf debian/*.postrm
    rm -vf debian/*.service
}


# debian changelog
# ================
function debian_changelog {
    if [ ! -f debian/changelog ]; then
        sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
            -e "s/\@DISTRIBUTION\@/${DISTRIBUTION}/g" \
            -e "s/\@VERSION\@/${VERSION}/g" \
            -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
            -e "s/\@DISPLAY\@/${DISPLAY}/g" \
            templates/debian/changelog \
            > debian/changelog
    fi
}


# basic control
# =============
function basic_control {
    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISTRIBUTION\@/${DISTRIBUTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/${1}-control \
        > debian/control
}


# grub template
# =============
function grub_template {
    mkdir -p ${1}/etc/default/grub.d
    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISTRIBUTION\@/${DISTRIBUTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${1}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/grub/template.cfg \
        > ${1}/etc/default/grub.d/siduction.cfg
}


# debian rules
# ============
function debian_rules {
    sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
        -e "s/\@DISTRIBUTION\@/${DISTRIBUTION}/g" \
        -e "s/\@VERSION\@/${VERSION}/g" \
        -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
        -e "s/\@DISPLAY\@/${DISPLAY}/g" \
        templates/debian/rules \
        > debian/rules
    chmod 755 debian/rules
}

# debian foo basics
function debian_foo_basics {
    cp -a templates/debian/source debian
    cp    templates/debian/compat debian
}

