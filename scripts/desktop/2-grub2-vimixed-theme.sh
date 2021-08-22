#!/bin/bash

install() {
    sudo git clone https://saecki@github.com/saecki/vimixed.git /boot/grub2/themes/vimixed
    echo "GRUB_THEME=/boot/grub2/themes/vimixed/theme.txt" | sudo tee -a /etc/default/grub
}

update() {
    sudo git -C /boot/grub2/themes/vimixed pull origin master
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

