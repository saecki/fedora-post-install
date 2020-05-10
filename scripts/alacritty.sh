git clone https://github.com/alacritty/alacritty.git /usr/local/src/alacritty


sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-st/ name 'launch-terminal'
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-st/ command 'alacritty -t "magic box"'
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-st/ binding '<Super>Return'

oldkeybindings=$(sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
keybindings="${oldkeybindings::-1}, '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/']"
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$keybindings"
