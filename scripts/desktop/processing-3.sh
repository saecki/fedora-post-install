#!/bin/sh

vers="3.5.4"

install() {
    dl_dir=$(mktemp -d)

    sudo rm -rf /opt/processing-3*

    wget -O "$dl_dir/processing.tar.gz" "https://download.processing.org/processing-$vers-linux64.tgz"
    sudo tar xzf "$dl_dir/processing.tar.gz" -C /opt

    sudo create-desktop-file \
    -e "/opt/processing-$vers/processing" \
    -n "Processing IDE" \
    -i "/opt/processing-$vers/lib/icons/pde-1024.png" \
    -f processing-ide
}

update() {
    echo "Update the version number and reinstall"
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

