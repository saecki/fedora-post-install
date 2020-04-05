git clone --bare https://saecki@bitbucket.org/saecki/.dotfiles.git /home/"$INSTALL_USER"/.dotfiles
git --work-tree=/home/"$INSTALL_USER" --git-dir=/home/"$INSTALL_USER"/.dotfiles checkout -f
