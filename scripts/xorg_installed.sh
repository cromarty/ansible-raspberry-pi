#!/bin/bash

cat ../docs/xorg-dev.pkgs | \
while read PKG
do
    dpkg -s ${PKG} &>/dev/null
    if [ $? -ne 0 ] ; then
        echo "${PKG} not installed"
else
    echo "${PKG} is installed"
    fi
done

