
#!/bin/sh

install() {
    git clone --bare https://saecki@github.com/saecki/stuff.git $HOME/.stuff
    git --work-tree=$HOME --git-dir=$HOME/.stuff checkout -f
}

update() {
    git --work-tree=$HOME --git-dir=$HOME/.stuff pull origin master
    git --work-tree=$HOME --git-dir=$HOME/.stuff checkout -f
}

. ../util/manage.sh
