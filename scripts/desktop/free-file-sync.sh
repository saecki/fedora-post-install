#!/bin/sh

fetch_version() {
    vers=$(curl https://freefilesync.org/download.php | rg --no-filename \
        -e "^(.*?)FreeFileSync_(.*?)_Linux.tar.gz(.*?)$" -r '$2')
    echo "$vers"
}

download() {
    vers="$1"
    dl_dir=$(mktemp -d)

    sudo rm -rf /opt/FreeFileSync

    wget -O "$dl_dir/FreeFileSync.tar.gz" "https://freefilesync.org/download/FreeFileSync_${vers}_Linux.tar.gz"
    tar xzf "$dl_dir/FreeFileSync.tar.gz" -C "$dl_dir"

    expect_commands="
    spawn $dl_dir/FreeFileSync_${vers}_Install.run
    sleep 1
    send \"y\\r\"
    sleep 1
    send \"y\\r\"
    expect eof {exit}"

    (cd "$dl_dir" && sudo expect -c "${expect_commands//
    /;}")
}

install() {
    vers=$(fetch_version)
    if [[ $vers == "" ]]; then
        echo -e "\nunable to fetch version"
        exit 1
    else
        echo -e "\ninstalling version $vers\n"
    fi

    download "$vers"
}

update() {
    if [[ -e /opt/FreeFileSync/CHANGELOG ]]; then
        line=$(head -n 1 /opt/FreeFileSync/CHANGELOG)
        pat="^FreeFileSync (.*) \[[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}\]"
        if [[ "$line" =~ $pat ]]; then
            local_vers="${BASH_REMATCH[1]}"
            if [[ $local_vers == "" ]]; then
                echo -e "\nunable to read local version"
                exit 1
            fi

            newest_vers=$(fetch_version)
            if [[ $newest_vers == "" ]]; then
                echo -e "\nunable to fetch version"
                exit 1
            fi
            echo "Local version: '$local_vers'"
            echo "Newest version: '$newest_vers'"

            if [[ "$local_vers" != "$newest_vers" ]]; then
                echo -e "\ninstalling version $newest_vers\n"
                download "$newest_vers"
            else
                echo -e "\nversion $local_vers is already installed"
            fi
        else
            echo "couldn't read installed version"
            exit 1
        fi
    else
        echo -e "\nFreeFileSync isn't installed, installing ...\n"
        install
    fi
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

