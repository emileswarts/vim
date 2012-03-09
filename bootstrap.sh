#!/bin/bash
main() {
	removeDotfiles 
	cloneDotfilesFromGit 
	removeSymlinkedDotfiles 
	relinkSymlinkDotfiles
}

removeDotfiles() { 
	echo "rm -fr ~/dotfiles" 
}

cloneDotfilesFromGit() { 
	echo "git clone git@github.com:emileswarts/dotfiles.git" 
}

removeSymlinkedDotfiles() {
	for file in `ls -a ~/dotfiles | grep -v '^\.\.$' |grep -v '^\.$' | grep -v '^README$' |grep -v '^compiz-settings.profile$' |grep -v '^gnome-terminal-conf.xml$' |grep -v '^bootstrap.sh$'` 
	do
	   echo "rm -fr ~/$file"
	done
}

relinkSymlinkDotfiles() {
	for file in `ls -a ~/dotfiles | grep -v '^\.\.$' |grep -v '^\.$' | grep -v '^README$' |grep -v '^compiz-settings.profile$' |grep -v '^gnome-terminal-conf.xml$' |grep -v '^bootstrap.sh$'` 
	do
		echo "ln -s ~/$file ~/dotfiles/$file"
	done
}

#GO!
main
