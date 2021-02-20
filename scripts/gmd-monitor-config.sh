#!/bin/bash

install() {
    sudo ln "$HOME/.config/monitors.xml" /var/lib/gdm/.config/
}

update() {
    echo "No need to update the monitor config"
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
