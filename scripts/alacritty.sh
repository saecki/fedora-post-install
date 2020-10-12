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

    executable="/usr/local/bin/launch-alacritty"

    sudo /usr/local/bin/create-desktop-file \
	-e $executable \
	-n Alacritty \
	-g Alacritty
}

update() {
    git -C $HOME/Documents/projects/alacritty pull origin master
    
    compile
}

. "$(dirname $(dirname $(realpath $0)))/util/manage.sh"
