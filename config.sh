#!/usr/local/bin/bash

# 配置代码片段
if test -d /Users/qingtian/Library/Developer/Xcode
then
  echo 'Xcode exist, config code snippets'
  . ./CodeSnippets/codeSnippets.sh
  echo 'code snippets finish'
fi

