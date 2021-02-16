#!/bin/bash

repos() {
    util/repo.sh repos/*
}

packages() {
    util/packages.sh packages/*
}

settings() {
    util/settings.sh settings/*
}

scripts_install() {
    for file in scripts/*; do
	if [[ $file == *.sh ]]; then
	    echo -e "\nexecuting $file:"
	    $file -i
	fi
    done
} 

scripts_update() {
    for file in scripts/*; do
	if [[ $file == *.sh ]]; then
	    echo -e "\nexecuting $file:"
	    $file -u
	fi
    done
} 

install() {
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
