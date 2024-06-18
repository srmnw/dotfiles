#! /usr/bin/bash

if ! node -v &> /dev/null; then
    echo "installing nodejs..."
    curl -sL install-node.vercel.app/lts | sudo bash
fi

declare -a dotfiles=(
    ".bashrc"
    ".bash_aliases"
    ".tmux.conf"
    ".vimrc"
    ".gitconfig"
)

declare -a install_dirs=(
    "usr"
)

echo "Applying repo ..."

for f in "${dotfiles[@]}"; do
    printf "\n"

    while true; do
        read -n 1 -p ">>>>>> apply $f file to filesystem?[y/n]:" yn
        case $yn in
            [Yy]* ) cp $f ~/$f; break;;
            [Nn]* ) break;;
            *     ) echo "please answer yes or no";;
        esac
    done
done

# install vim plugins
vim +PluginInstall +qall

# install tmux plugins
/.tmux/plugins/tpm/bin/install_plugins
