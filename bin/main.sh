#!/bin/sh

CURRENT_HOME=~/myRepo/myconfigs/bin

# homebrew
if [[ ! -f '/usr/local/bin/brew' ]];then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
fi 

	brew install vim
	brew install git-extras # git 扩展
	brew install imagemagic
    brew install mas
#    brew install ffmpeg
    brew cask install macdown
    brew cask install google-chrome
    brew cask install iterm2
#	brew cask install dozer # 菜单栏隐藏工具	
  brew install bash-completion

	# mas	
	mas install 497799835 # Xcode
#	mas install 405843582 # Alfred  版本太老
	mas install 1356055347 # 印象笔记
	mas install 425424353 # The Unarchiver
#	mas install 1181350496 # WebFont 
	mas install 789066512 # Maipo
	mas install 944848654 # 网易云音乐
	mas install 451108668 # QQ 
	mas install 836500024 # WeChat
	mas install 488709442 # Visual JSON
	mas install 491854842 # 有道翻译
	mas install 702682966 # 搜狗输入助手
#	mas install 1345770177 #蓝信

	# CocoaPods
	sudo gem install cocoapods --verbose
    pod setup --verbose

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
