dl_dir=$(mktemp -d)

curl -1sLf "https://dl.cloudsmith.io/public/balena/etcher/config.rpm.txt?distro=fedora&version=$(rpm -E %fedora)&arch=$(uname -m)" > "$dl_dir/etcher.repo"

dnf config-manager --add-repo "$dl_dir/etcher.repo"
