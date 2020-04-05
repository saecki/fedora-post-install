wget https://freefilesync.org/download/FreeFileSync_10.22_Linux.tar.gz
tar xzf FreeFileSync_10.22_Linux.tar.gz -C /opt
rm FreeFileSync_10.22_Linux.tar.gz
/usr/local/bin/create-desktop-file -e /opt/FreeFileSync/FreeFileSync -n FreeFileSync -i /opt/FreeFileSync/Resources/FreeFileSync.png
