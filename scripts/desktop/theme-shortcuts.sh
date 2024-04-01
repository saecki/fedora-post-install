install() {
    oldkeybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

    quotes="${oldkeybindings//[^\']}"
    amount="${#quotes}"

    if [[ $amount == "0" ]]; then
        oldkeybindings="["
    else
        oldkeybindings="${oldkeybindings::-1},"
    fi

    keybindings="$oldkeybindings"

    togglekeybinding="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/toggle-theme/"
    if [[ $keybindings != *"$togglekeybinding"* ]]; then
        echo "adding toggle-theme keybinding"
        keybindings="$keybindings'$togglekeybinding',"
    else
        echo "toggle-theme keybinding already present, updating it"
    fi

    reloadkeybinding="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/reload-theme/"
    if [[ $keybindings != *"$reloadkeybinding"* ]]; then
        echo "adding reload-theme keybinding"
        keybindings="$keybindings'$reloadkeybinding',"
    else
        echo "reload-theme keybinding already present, updating it"
    fi

    keybindings="${keybindings::-1}]"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$keybindings"

    keybindingpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$togglekeybinding"
    gsettings set $keybindingpath name "'Toggle theme'"
    gsettings set $keybindingpath command "'$HOME/.local/bin/theme toggle'"
    gsettings set $keybindingpath binding "'<Super>t'"

    keybindingpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$reloadkeybinding"
    gsettings set $keybindingpath name "'Reload theme'"
    gsettings set $keybindingpath command "'$HOME/.local/bin/theme reload'"
    gsettings set $keybindingpath binding "'<Super>r'"
}

update() {
    install
}

. "$(dirname $(dirname $(dirname $(realpath $0))))/util/manage.sh"

