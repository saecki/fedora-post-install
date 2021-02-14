#!/bin/sh

while getopts "iuh" opt; do
    case "$opt" in
        i ) install; exit;;
        u ) update; exit;;
    esac
done

echo "Use the -i flag to install or -u to update."
