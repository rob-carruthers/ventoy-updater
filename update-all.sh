#!/bin/bash

for dir in $(ls -d */); do
	cd $dir
	./update.sh
	cd ..
done
