#!/bin/sh

compile() {
    $HOME/.cargo/bin/cargo build \
	--manifest-path=$HOME/Documents/projects/alacritty/Cargo.toml \
	--release

    sudo cp \
	$HOME/Documents/projects/alacritty/target/release/alacritty \
	/usr/local/bin/
}

install() {
    git clone https://github.com/alacritty/alacritty.git $HOME/Documents/projects/alacritty

    compile

    if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	executable="/usr/local/bin/alacritty-wayland"
    else
	executable="/usr/local/bin/alacritty"
    fi

    sudo /usr/local/bin/create-desktop-file \
	-e $executable \
	-n Alacritty \
	-g Alacritty
    
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
    
    keybindingpath="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/"
    gsettings set $keybindingpath name "'launch-terminal'"
    gsettings set $keybindingpath command "'$executable -t \"magic box\"'"
    gsettings set $keybindingpath binding "'<Super>Return'"
}

update() {
    git -C $HOME/Documents/projects/alacritty pull origin master
    
    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
