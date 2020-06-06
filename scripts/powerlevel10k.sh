
#!/bin/sh

install() {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
}

update() {
    git -C $HOME/.oh-my-zsh/custom/themes/powerlevel10k pull
}

. ../util/manage.sh