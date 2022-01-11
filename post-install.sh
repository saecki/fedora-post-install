#!/bin/sh

. "$(dirname $0)/util/print.sh"

is_desktop() {
    [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]
}

repos() {
    heading1 "Repos"
    util/repo.sh repos/*
}

packages() {
    heading1 "Packages"
    heading2 "installing headless packages"
    util/packages.sh packages/headless/*

    if is_desktop; then
        heading2 "installing desktop packages"
        util/packages.sh packages/desktop/*
    fi
}

settings() {
    heading1 "Settings"
    if is_desktop; then
        util/settings.sh settings/*
    fi
}

exec_files() {
    for file in $1/*; do
        if [[ $file == *.sh ]]; then
            heading3 "\nexecuting $file with $2:"
            $file $2
        fi
    done
}

scripts_install() {
    heading1 "Scripts"
    heading2 "installing headless scripts"
    exec_files "scripts/headless" -i

    if is_desktop; then
        heading2 "installing desktop scripts"
        exec_files "scripts/desktop" -i
    fi
}

scripts_update() {
    heading1 "Scripts"
    heading2 "updating headless scripts"
    exec_files "scripts/headless" -u

    if is_desktop; then
        heading2 "updating desktop scripts"
        exec_files "scripts/desktop" -u
    fi
}

install() {
    install_heading

    echo "Did you create a ssh key for github?"
    read

    heading1 "Update"
    sudo dnf upgrade --refresh -y

    repos
    packages
    scripts_install
    settings
}

update() {
    update_heading

    heading1 "Update"
    sudo dnf upgrade --refresh -y
    
    repos
    packages
    scripts_update
    settings
}

help() {
    echo "
Flags:
    -r repos
    -p packages
    -s settings
    -i installation procedure
    -u update procedure
    "
}

while getopts "hrpsiu" opt; do
    case "$opt" in
    r ) repos; exit;;
    p ) packages; exit;;
    s ) settings; exit;;
    i ) install; exit;;
    u ) update; exit;;
    h ) help; exit;;
    * ) help; exit 1;;
    esac
done

