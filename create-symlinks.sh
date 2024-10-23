#!/usr/bin/env bash

dotdir=$(pwd)

create()
{
	if test -f $2 || test -d $2
	then
		echo "$2 already exist, skipping this..."
	else
		ln -s $dotdir/$1 $2
		echo "created link from $dotdir/$1 to $2"
	fi
}

create .vimrc ~/.vimrc
create .vim ~/.vim
create .bashrc ~/.bashrc
create .bash_aliases ~/.bash_aliases
create .gitconfig ~/.gitconfig
mkdir -p ~/.config
create awesome ~/.config/awesome
create .tmux.conf ~/.tmux.conf
