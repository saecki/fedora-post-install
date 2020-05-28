
#!/bin/sh

install() {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
}

update() {
    git -C $HOME/.oh-my-zsh/custom/themes/powerlevel10k pull
}

while getopts "iu" opt; do
    case "$opt" in 
	i ) install;;
	u ) update;;
    esac
done

