git clone -b gnome-3-36 https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock
sudo -Hu $INSTALL_USER make
sudo -Hu $INSTALL_USER make install
cd ..
rm -rf dash-to-dock
