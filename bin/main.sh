#!/bin/sh

CURRENT_HOME=~/myRepo/myconfigs/bin

# homebrew
if [[ ! -f '/usr/local/bin/brew' ]];then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install vim
	# git 扩展
	brew install git-extras
	brew install imagemagic
	brew install macdown
	brew install mas
	brew install google-chrome
	
	
	mas install 
fi 

# alias
if [ -f $CURRENT_HOME/alias.sh ]; then
	source "$CURRENT_HOME/alias.sh"
fi

# git completion
if [ -f ~/.git-completion.bash ]; then
    source "~/.git-completion.bash"
fi


# Xcode build
XcodeBuild=$CURRENT_HOME"/XcodeBuild"
export PATH="$XcodeBuild:$PATH"
