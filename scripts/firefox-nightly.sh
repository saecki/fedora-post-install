#!/bin/bash

install() {
    dl_dir=$(mktemp -d)

    wget -O "$dl_dir/firefox-nightly.tar.bz" "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"

    sudo rm -rf /opt/firefox-nightly
    mkdir "$dl_dir/extract"
    tar xf "$dl_dir/firefox-nightly.tar.bz" -C "$dl_dir/extract"
    firefox_dir=$(find "$dl_dir/extract" -maxdepth 1 -type d -name firefox\* -print | head -n1)
    sudo mv "$firefox_dir" /opt/firefox-nightly

    sudo /usr/local/bin/create-desktop-file \
    -e "/opt/firefox-nightly/firefox %u" \
    -f "firefox-nightly" \
    -n "Firefox Nightly" \
    -i /opt/firefox-nightly/browser/chrome/icons/default/default128.png
}

update() {
    echo "Let firefox nightly update itself or reinstall it"
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"

