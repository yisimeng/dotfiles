#!/usr/local/bin/bash

# 配置代码片段
if test -d ~/Library/Developer/Xcode
then
  echo 'Xcode exist, config code snippets'
  . ./codeSnippets.sh
  echo 'code snippets finish'
fi

