git clone https://bitbucket.org/saecki/st.git /usr/local/src/st
make clean install -C /usr/local/src/st
/usr/local/bin/create-desktop-file -e /usr/local/bin/st -n st -g org.gnome.Terminal
