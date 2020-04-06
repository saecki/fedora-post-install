wget https://discordapp.com/api/download\?platform\=linux\&format\=tar.gz
tar xzf "download?platform=linux&format=tar.gz" -C /opt/
rm "download?platform=linux&format=tar.gz"
/usr/local/bin/create-desktop-file -e /opt/Discord/Discord -n Discord -i /opt/Discord/discord.png

