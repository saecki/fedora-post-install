sudo -H -u $INSTALL_USER sh -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs >
"$HOME"/temp; sh $HOME/temp -y; rm $HOME/temp'
