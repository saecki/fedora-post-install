info=$(curl https://www.teamspeak.com/versions/client.json | jq -r '.linux.x86_64')
version=$(echo $info | jq -r '.version')
url=$(echo $info | jq -r '.mirrors."teamspeak.com"')
wget $url
chmod +x TeamSpeak3-Client-linux_amd64-$version.run
./TeamSpeak3-Client-linux_amd64-$version.run
mv TeamSpeak3-Client-linux_amd64 /opt
/usr/local/bin/create-desktop-file -e /opt/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh -n "TeamSpeak 3"
rm TeamSpeak3-Client-linux_amd64-$version.run
