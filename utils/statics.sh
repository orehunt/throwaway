#!/bin/sh

if [ $(find | wc -l) != 1 ]; then
	echo "switch to an empty dir for the rootfs"
	exit 1
fi

wget https://raw.githubusercontent.com/minos-org/minos-static/master/static-get
chmod +x static-get

./static-get -x htop busybox
