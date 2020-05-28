#!/bin/sh

install() {
    sudo git clone https://saecki@bitbucket.org/saecki/vimixed.git /boot/grub2/themes/vimixed
    sudo echo "GRUB_THEME=/boot/grub2/themes/vimixed/theme.txt" >> /etc/default/grub
}

update() {
    sudo git -C /boot/grub2/themes/vimixed pull origin master
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

