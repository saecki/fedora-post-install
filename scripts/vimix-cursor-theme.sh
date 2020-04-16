git clone https://github.com/vinceliuice/Vimix-cursors.git
cd Vimix-cursors
./install.sh
cd ..
rm -rf Vimix-cursors

sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.desktop.interface cursor-theme Vimix-white-cursors
