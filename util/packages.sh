#!/bin/sh
    
for file in $@; do
    if [[ $file == *.pkglst ]]; then
        while read line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages=$packages" $line"
            fi
        done < $file

        echo -e "\ninstalling $file:"
        sudo dnf install -y $packages
        
        packages=""
    fi

    if [[ $file == *.grplst ]]; then
        while read line; do
            if [[ $line != "" ]] && [[ $line != "#"* ]]; then
                packages=$packages" $line"
            fi
        done < $file

        echo -e "\ninstalling $file:"
        sudo dnf group install -y $packages
        
        packages=""
    fi
done
