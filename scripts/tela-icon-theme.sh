git clone https://github.com/vinceliuice/Tela-icon-theme.git
Tela-icon-theme/install.sh blue
rm -rf Tela-icon-theme
sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.desktop.interface icon-theme Tela-blue-dark
