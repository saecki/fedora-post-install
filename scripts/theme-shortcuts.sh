install() {
    oldkeybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

    commas="${oldkeybindings//[^\']}"
    amount="${#commas}"

    if [[ $amount == "0" ]]; then
        oldkeybindings="["
    else
        oldkeybindings="${oldkeybindings::-1},"
    fi

    keybindings="$oldkeybindings"

    keybinding="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/toggle-theme/"
    if [[ $keybindings != *"$keybinding"* ]]; then
        echo "adding toggle-theme keybinding"
        keybindings="$keybindings'$keybinding',"
    else
        echo "toggle-theme keybinding already present, updating it"
    fi

    keybindings="${keybindings::-1}]"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$keybindings"

    keybindingpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$keybinding"
    gsettings set $keybindingpath name "'Toggle theme'"
    gsettings set $keybindingpath command "'~/.local/bin/theme toggle'"
    gsettings set $keybindingpath binding "'<Super>t'"
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
