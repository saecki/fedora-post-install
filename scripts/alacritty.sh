
#!/bin/sh

install() {
    git clone https://github.com/alacritty/alacritty.git $HOME/Documents/IdeaProjects/alacritty

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
	/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/ \
	name 'launch-terminal'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
	/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/ \
	command 'alacritty -t "magic box"'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
	/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/ \
	binding '<Super>Return'

    oldkeybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

    commas="${oldkeybindings//[^\']}"
    amount="${#commas}"

    if [[ $amount == "0" ]]; then
	oldkeybindings="["
    else
	oldkeybindings="${oldkeybindings::-1}, "
    fi

    keybindings="$oldkeybindings'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/']"
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$keybindings"
}

update() {
    git -C $HOME/Documents/IdeaProjects/alacritty pull origin master
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

