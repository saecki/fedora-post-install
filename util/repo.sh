#!/bin/sh

. "$(dirname $0)/print.sh"

for file in "$@"; do
    if [[ $file == *.repo ]]; then
        heading2 "copying $file to /etc/yum.repos.d/"
        sudo cp "$file" /etc/yum.repos.d/
    fi

    if [[ "$file" == *.install ]]; then
        heading2 "installing repos $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                package=$(eval "echo $line")
                packages="$packages $package"
            fi
        done < "$file"
        sudo dnf install -y $packages
        packages=""
    fi

    if [[ $file == *.copr ]]; then
        heading2 "enabling copr repo $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                sudo dnf copr enable -y "$line"
            fi
        done < "$file"
    fi

    if [[ "$file" == *.sh ]]; then
        heading2 "installing repos $file"
        sudo $file
    fi

    if [[ $file == *.flatpak ]]; then
        heading2 "adding flatpak remotes $file"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                echo -e "\nadding flatpak remote $line"
                flatpak remote-add --if-not-exists $line
            fi
        done < "$file"
    fi
done

