url=$(curl https://www.teamspeak.com/versions/client.json| jq -r '.linux.x86_64.mirrors."teamspeak.com"')
wget $url
chmod +x TeamSpeak3-Client-linux_amd64*.run
./TeamSpeak3-Client-linux_amd64*.run
