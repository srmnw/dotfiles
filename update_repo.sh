#! /usr/bin/bash

declare -a dotfiles=(".bashrc"
		  ".bash_aliases"
		  ".tmux.conf"
		  ".vimrc"
		 )

declare -a dir=(""
	       )

echo "Updating repo ..."

for f in "${dotfiles[@]}"; do
	printf "\n"

	if [ ! -f "$f" ]; then
		echo "$f does not exist in repo"
		while true; do
			read -n 1 -p ">>>>>> copy $f file into repo?[y/n]:" yn
			case $yn in
				[Yy]* ) cp ~/$f $f; break;;
				[Nn]* ) break;;
				*     ) echo "please answer yes or no";;
			esac
		done
		continue
	fi

	DIFF=$(diff ~/$f $f)
	if [ "$DIFF" != "" ]; then
		echo ">>>>>> $f has following diff:"
		echo "$DIFF"
		while true; do
			read -n 1 -p ">>>>>> update $f file in repo?[y/n/p]:" yn
			case $yn in
				[Yy]* ) cp ~/$f $f; git add $f; break;;
				[Pp]* ) cp ~/$f $f; git add -p $f; git checkout -- $f; break;;
				[Nn]* ) break;;
				*     ) echo "please answer yes or no or partial";;
			esac
		done
	fi
done

