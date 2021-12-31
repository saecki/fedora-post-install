#!/bin/bash

install() {
    sudo ln "$HOME/.config/monitors.xml" /var/lib/gdm/.config/
}

update() {
    sudo rm /var/lib/gdm/.config/
    sudo ln "$HOME/.config/monitors.xml" /var/lib/gdm/.config/
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

