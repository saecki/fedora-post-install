#!/bin/sh

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

    keybinding="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-term/"
    if [[ *"'$keybinding'"* != $keybindings ]]; then
        echo "adding launch-term keybinding"
        keybindings="$keybindings'$keybinding',"
    else
        echo "launch-term keybinding already present"
    fi

    tmuxkeybinding="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-term-tmux/"
    if [[ *"'$tmuxkeybinding'"* != $keybindings ]]; then
        echo "adding launch-term-tmux keybinding"
        keybindings="$keybindings'$tmuxkeybinding',"
    else
        echo "launch-term-tmux keybinding already present"
    fi

    keybindings="${keybindings::-1}]"

    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$keybindings"

    keybindingpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$keybinding"
    gsettings set $keybindingpath name "'launch-term'"
    gsettings set $keybindingpath command "'$launchterm -t \"magic box\"'"
    gsettings set $keybindingpath binding "'<Super><Shift>Return'"

    tmuxkeybindingpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$tmuxkeybinding"
    gsettings set $tmuxkeybindingpath name "'launch-term-tmux'"
    gsettings set $tmuxkeybindingpath command "'$launchterm -t \"magic box\" -e tmux'"
    gsettings set $tmuxkeybindingpath binding "'<Super>Return'"
}

update() {
    install
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
