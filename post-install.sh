#!/bin/sh

repos() {
    for file in repos/*; do
	if [[ $file == *.repo ]]; then
	    echo -e "\ncopying $file to /etc/yum.repos.d/"
	    sudo cp repos/* /etc/yum.repos.d/
	fi

	if [[ $file == *.install ]]; then
	    while read line; do
		if [[ $line != "" ]] && [[ $line != "#"* ]]; then
		    packages=$packages" $line"
		fi
	    done < $file

	    echo -e "\ninstalling repo $file:"
	    sudo dnf install -y $packages

	    packages=""
	fi
	
	if [[ $file == *.copr ]]; then
	    while read line; do
		if [[ $line != "" ]] && [[ $line != "#"* ]]; then
		    sudo dnf copr enable -y $line
		fi
	    done < $file

	    echo -e "\nenabling copr repo $file:"
	fi
    done
}

packages() {
    for file in packages/*; do
	if [[ $file == *.pkglst ]]; then
	    while read line; do
		if [[ $line != "" ]] && [[ $line != "#"* ]]; then
		    packages=$packages" $line"
		fi
	    done < $file

	    echo -e "\ninstalling $file:"
	    sudo dnf install -y $packages
	    
	    packages=""
	fi

	if [[ $file == *.grplst ]]; then
	    while read line; do
		if [[ $line != "" ]] && [[ $line != "#"* ]]; then
		    packages=$packages" $line"
		fi
	    done < $file

	    echo -e "\ninstalling $file:"
	    sudo dnf group install -y $packages
	    
	    packages=""
	fi
    done
}

scripts_install() {
    for file in scripts/*; do
	if [[ $file == *.sh ]]; then
	    echo -e "\nexecuting $file:"
	    $file -i
	fi
    done
} 

scripts_update() {
    for file in scripts/*; do
	if [[ $file == *.sh ]]; then
	    echo -e "\nexecuting $file:"
	    $file -u
	fi
    done
} 

settings() {
    for file in settings/*; do
	if [[ $file == *.gsettings ]]; then
	    echo -e "\napplying settings from $file:"
	    
	    while read line; do
		if [[ $line != "" ]] && [[ $line != "#"* ]]; then
		    gsettings set $line
		fi
	    done < $file

	fi
    done
}

install() {
    # update
    echo -e "\n## Update ##"
    sudo dnf upgrade --refresh -y

    # repos
    echo -e "\n## Repos ##"
    repos

    # packages
    echo -e "\n## Packages ##"
    packages

    # scripts
    echo -e "\n## Scripts ##"
    scripts_install

    # settings
    echo -e "\n## Settings ##"
    settings
}

update() {
    # update
    echo -e "\n## Update ##"
    sudo dnf upgrade --refresh -y

    # scripts
    echo -e "\n## Scripts ##"
    scripts_update
}

#!/bin/sh

while getopts "hiprsu" opt; do
    case "$opt" in 
	r ) repos; exit;;
	p ) packages; exit;;
	s ) settings; exit;;
	i ) install; exit;;
	u ) update; exit;;
    esac
done

echo "Use the -i flag to install or -u to update."
