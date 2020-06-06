#!/bin/sh

install() {
    sudo ln -s /boot/efi/EFI/fedora/grub.cfg /boot/grub2/
    sudo /usr/local/bin/update-grub
}

update() {
    echo "no need to update"
}

. ../util/manage.sh