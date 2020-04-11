sudo -Hu $INSTALL_USER git clone https://github.com/saecki/playlist_localizer.git 
cd playlist_localizer
sudo -Hu $INSTALL_USER /home/$INSTALL_USER/.cargo/bin/cargo build --release 
cp target/release/playlist_localizer /usr/local/bin
cd ..
rm -rf playlist_localizer
