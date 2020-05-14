sudo -Hu $INSTALL_USER git clone https://github.com/alacritty/alacritty.git /home/$INSTALL_USER/Documents/IdeaProjects/alacritty

sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/ name 'launch-terminal'
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/ command 'alacritty -t "magic box"'
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/ binding '<Super>Return'

oldkeybindings=$(sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

commas="${oldkeybindings//[^\']}"
amount="${#commas}"

if [[ $amount == "0" ]]; then
    oldkeybindings="["
else
    oldkeybindings="${oldkeybindings::-1}, "
fi

keybindings="$oldkeybindings'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/launch-terminal/']"
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$keybindings"
