git clone --bare https://saecki@bitbucket.org/saecki/.scripts.git /usr/local/bin/.scripts
git --work-tree=/usr/local/bin/ --git-dir=/usr/local/bin/.scripts checkout -f
