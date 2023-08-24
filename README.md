# fedora-post-install
A post install script for fedora.

## Create a github ssh key
`ssh-keygen -t ed25519 -C "your_email@example.com"`

## repos
`.repo` extensions for yum repo files that will be copied into /etc/yum.repos.d/.<br />
`.install` extensions for rpm repository packages to install.<br />
`.copr` extensions for a list of copr repos that will be enabled.<br />

## packages
`.pkglst` extensions for a list of packages that will be installed using `dnf`.<br />
`.grplst` extensions for a list of package groups that will be installed using `dnf`.<br />
`.cargo` extensions for a list of crates.io packages that will be installed using `cargo`.<br />
`.pip3` extensions for a list of pypi packages that will be installed using `pip3`.<br />
`.luarocks` extensions for a list of luarocks packages that will be installed using `luarocks`.<br />

## scripts

All files in the scripts dir will be executed, they usually should accept `-i` for initial installation and `-u` for updating.

## settings
`.gsettings` extensions for gsettings schemas with key value pairs that will be set using gsettings.
For schemas that are not installed system wide a custom schema dir can be defined using:
`schemadir:<dir>`

