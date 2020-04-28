sudo -Hu $INSTALL_USER DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $INSTALL_USER)/bus gsettings set org.gnome.desktop.interface monospace-font-name "Monospace 10"
