#!/bin/sh

install() {
    sudo git clone https://saecki@github.com/saecki/vimixed.git /boot/grub2/themes/vimixed
    sudo echo "GRUB_THEME=/boot/grub2/themes/vimixed/theme.txt" >> /etc/default/grub
}

update() {
    sudo git -C /boot/grub2/themes/vimixed pull origin master
}

. "$(dirname $(dirname $0))/util/manage.sh"
