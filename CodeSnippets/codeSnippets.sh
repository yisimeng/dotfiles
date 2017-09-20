#!/usr/local/bin/bash

echo '配置Xcode代码片段'

if test -d ~/Library/Developer/Xcode/UserData/CodeSnippets
then
  echo 'file exist, merge'
  cp -i CodeSnippets/* ~/Library/Developer/Xcode/UserData/CodeSnippets/
  echo 'copy file complete'
else
  echo 'code snippets not exist'
  cp -ir CodeSnippets ~/Library/Developer/Xcode/UserData/CodeSnippets
  echo 'copy file complete'
fi


