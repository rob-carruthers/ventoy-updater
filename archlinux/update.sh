#!/bin/bash

rm -f b2sums.txt
wget -q http://archlinux.uk.mirror.allworldit.com/archlinux/iso/latest/b2sums.txt

b2sum -c --ignore-missing b2sums.txt
STATUS=$?

if [[ $STATUS != 0 ]]; then
	rm -f archlinux-x86_64.iso
	wget http://archlinux.uk.mirror.allworldit.com/archlinux/iso/latest/archlinux-x86_64.iso
fi

rm b2sums.txt
