#!/bin/bash

SCRAPED_URL=$(curl https://www.system-rescue.org/Download/ | grep https://sourceforge.net/projects/systemrescuecd/files | grep -Eo 'https://[^ "]+' | head -n1)
REMOTE_ISO=$(echo ${SCRAPED_URL} | rev | cut -d "/" -f 2 | rev | sed 's/systemrescue/systemrescuecd/')
CURRENT_ISO=$(ls systemrescue*.iso)

if [[ "$REMOTE_ISO" != "$CURRENT_ISO" ]]; then
	wget $SCRAPED_URL
	mv download $REMOTE_ISO
	rm $CURRENT_ISO
fi
