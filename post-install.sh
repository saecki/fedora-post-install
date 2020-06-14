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

    echo -e "\nall done, you should be good to go!"
} 

scripts_update() {
    for file in scripts/*; do
	if [[ $file == *.sh ]]; then
	    echo -e "\nexecuting $file:"
	    $file -u
	fi
    done

    echo -e "\nall done, you should be good to go!"
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
}

update() {
    # update
    echo -e "\n## Update ##"
    sudo dnf upgrade --refresh -y

    # scripts
    echo -e "\n## Scripts ##"
    scripts_update
}

. util/manage.sh
