#!/bin/sh

CURRENT_HOME=~/myRepo/myconfigs/bin


if [ -f $CURRENT_HOME/alias.sh ]; then
	. $CURRENT_HOME/alias.sh
fi

if [ -f ~/.git-completion.bash ]
then
. ~/.git-completion.bash
fi

XcodeBuild=$CURRENT_HOME"/XcodeBuild"

export PATH="$XcodeBuild:$PATH"
