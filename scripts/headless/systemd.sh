#!/bin/bash

install() {
    sudo systemctl disable lvm2-monitor.service
}

update() {}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

