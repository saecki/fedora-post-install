#!/bin/bash

for file in "$@"; do
    if [[ $file == *.repo ]]; then
        echo -e "\ncopying $file to /etc/yum.repos.d/"
        sudo cp "$file" /etc/yum.repos.d/
    fi

    if [[ "$file" == *.install ]]; then
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                package=$(eval "echo $line")
                packages="$packages $package"
            fi
        done < "$file"

        echo "###$packages###"

        echo -e "\ninstalling repo $file:"
        sudo dnf install -y $packages

        packages=""
    fi

    if [[ $file == *.copr ]]; then
        echo -e "\nenabling copr repo $file:"
        while read -r line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                sudo dnf copr enable -y "$line"
            fi
        done < "$file"
    fi
done

