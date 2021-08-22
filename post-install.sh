#!/bin/bash

is_desktop() {
    [ "$XDG_SESSION_TYPE" == "wayland" ] || [ "$XDG_SESSION_TYPE" == "x11" ]
}

repos() {
    util/repo.sh repos/*
}

packages() {
    echo "installing headless packages"
    util/packages.sh packages/headless/*

    if is_desktop; then
        echo "installing desktop packages"
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
            echo -e "\nexecuting $file with $2:"
            $file $2
        fi
    done
}

scripts_install() {
    echo "installing headless scripts"
    exec_files "scripts/headless" -i

    if is_desktop; then
        echo "installing desktop scripts"
        exec_files "scripts/desktop" -i
    fi
}

scripts_update() {
    echo "updating headless scripts"
    exec_files "scripts/headless" -u

    if is_desktop; then
        echo "updating desktop scripts"
        exec_files "scripts/desktop" -u
    fi
}

install() {
    echo "Did you create a ssh key for github?"
    read

    # update
    echo -e "\n## Update ##"
    sudo dnf upgrade --refresh -y

    # repos
    echo -e "\n## Repos ##"
    repos

    # packages
    echo -e "\n## Packages ##"
    packages

    # scripts
    echo -e "\n## Scripts ##"
    scripts_install

    # settings
    echo -e "\n## Settings ##"
    settings
}

update() {
    # update
    echo -e "\n## Update ##"
    sudo dnf upgrade --refresh -y

    # scripts
    echo -e "\n## Scripts ##"
    scripts_update
}

#!/bin/sh

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
