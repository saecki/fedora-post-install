#!/bin/sh

install() {
    sudo ln -s /boot/efi/EFI/fedora/grub.cfg /boot/grub2/
    sudo /usr/local/bin/update-grub
}

update() {
    echo "no need to update"
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

