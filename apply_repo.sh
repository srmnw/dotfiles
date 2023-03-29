#! /usr/bin/bash

declare -a dotfiles=(".bashrc"
		  ".bash_aliases"
		  ".tmux.conf"
		  ".vimrc"
		 )

declare -a dir=(""
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

