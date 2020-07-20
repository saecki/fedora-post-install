#!/bin/sh

if [[ $1 == *.repo ]]; then
    echo -e "\ncopying $1 to /etc/yum.repos.d/"
    sudo cp repos/* /etc/yum.repos.d/
fi

if [[ $1 == *.install ]]; then
    while read line; do
	if [[ $line != "" ]] && [[ $line != "#"* ]]; then
	    packages="$packages $line"
	fi
    done < $1

    echo -e "\ninstalling repo $1:"
    sudo dnf install -y $packages
fi
