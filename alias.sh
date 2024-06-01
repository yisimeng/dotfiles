#!/bin/sh

alias md="macdown"

# ls
alias la="ls -a"
alias ll="ls -l"

alias rmdir="rm -fr"

# 快捷打开工程
alias vso="code ."
alias xco='open *.xcworkspace || open *.xcodeproj'

# 快速打开Xcode模拟器
alias simo='open -a simulator'

# hosts
alias vihosts="sudo vi /etc/hosts"
alias cathosts="cat /etc/hosts"

# git 
gfb() {
    git fetch origin $1:$1
    git checkout $1
}
