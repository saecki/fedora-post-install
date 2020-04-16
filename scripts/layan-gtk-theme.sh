git clone https://github/com/vinceliuice/Layan-gtk-theme.git
Layan-gtk-theme/install.sh
rm -rf Layan-gtk-theme

sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.desktop.interface gtk-theme Layan-dark-solid
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.shell.extensions.user-theme name Layan-dark-solid

