#!/bin/sh

. "$(dirname $0)/util/print.sh"

is_desktop() {
    [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]
}

repos() {
    util/repo.sh repos/*
}

packages() {
    heading2 "installing headless packages"
    util/packages.sh packages/headless/*

    if is_desktop; then
        heading2 "installing desktop packages"
        util/packages.sh packages/desktop/*
    fi
}

settings() {
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
    heading2 "installing headless scripts"
    exec_files "scripts/headless" -i

    if is_desktop; then
        heading2 "installing desktop scripts"
        exec_files "scripts/desktop" -i
    fi
}

scripts_update() {
    heading2 "updating headless scripts"
    exec_files "scripts/headless" -u

    if is_desktop; then
        heading2 "updating desktop scripts"
        exec_files "scripts/desktop" -u
    fi
}

install() {
    echo "Did you create a ssh key for github?"
    read

    heading1 "Update"
    sudo dnf upgrade --refresh -y

    heading1 "Repos"
    repos

    heading1 "Packages"
    packages

    heading1 "Scripts"
    scripts_install

    heading1 "Settings"
    settings
}

update() {
    heading1 "Update"
    sudo dnf upgrade --refresh -y
    
    heading1 "Repos"
    repos

    heading1 "Packages"
    packages

    heading1 "Scripts"
    scripts_update
    
    heading1 "Settings"
    settings
}

while getopts "hiprsu" opt; do
    case "$opt" in
    r ) repos; exit;;
    p ) packages; exit;;
    s ) settings; exit;;
    i ) install; exit;;
    u ) update; exit;;
    * )
    esac
done

echo "
Flags:
-r install repos
-p install packages
-s install settings
-i run installation procedure
-u run update procedure
"
