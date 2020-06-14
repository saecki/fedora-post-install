# fedora-post-install
A post install script for fedora.  

## repos

```.repo``` extensions for yum repo files that will be copied into /etc/yum.repos.d/.  
```.install``` extensions for rpm repository packages to install.  

## packages

```.pkglst``` extensions for a list of packages that will be installed.  
```.grplst``` extensions for a list of package groups that will be installed.  

## scripts

```.sh``` extensions for shell scripts that will be executed.  
They usually should accept ```-i``` flags for initial installation and ```-u``` flags for updating.

## settings
```.gsettings``` extensions for gsettings schemas with key value pairs that will be set using gsettings.
