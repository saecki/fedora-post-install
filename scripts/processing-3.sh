#!/bin/sh

vers="3.5.4"

install() {
    dl_dir=$(mktemp -d)

    sudo rm -rf /opt/processing-3*

    wget -P $dl_dir https://github.com/processing/processing/releases/download/processing-0270-$vers/processing-$vers-linux64.tgz
    sudo tar xzf "$dl_dir/processing-$vers-linux64.tgz" -C /opt

    rm -rf $dl_dir

    sudo create-desktop-file \
	-e "/opt/processing-$vers/processing" \
	-n "Processing IDE" \
	-i "/opt/processing-$vers/lib/icons/pde-1024.png" \
	-f processing-ide
}

update() {
    echo "Update the version number and reinstall"
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
