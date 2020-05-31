#!/bin/sh
#cmd xxx.podspec 0.1.1

#***************************************************#
#              _build_framework.sh                  #
#           written by Duan Zengguang               #
#                  Aug 13, 2018                     #
#                                                   #
#           CocoaPods build framework               #
#                 cmd xxx.podspec                   #
#***************************************************#

set -e

#####################################################
function _git_commit{
# 提交到本地仓库
    if [ -e .git ]
    then
        echo "repository exist"
    else
        git init
    fi
    git add .
    git commit -m 'modify version,git repository'
}
#####################################################


# .podspec
PODSPEC_PATH=$1
# version
SDK_VERSION=$2
# SDK名称
SDK_NAME=$(basename $PODSPEC_PATH .podspec)
# 仓库
GIT_PATH=$PWD

# 修改版本号/git路径
sed -i "" 's,0.1.0,'"${SDK_VERSION}"',' $PODSPEC_PATH
sed -i "" 's,git repository,'"${GIT_PATH}"',' $PODSPEC_PATH

# 提交git
_git_commit

echo "build begin"

# 移除缓存
rm -fr ~/Library/Caches/CocoaPods/Pods/External/'${SDK_NAME}'

# 编译
pod package $PODSPEC_PATH --embedded --force

if [[ $? -ne 0 ]]; then
echo "编译失败！编译命令：pod package $PODSPEC_PATH --embedded --force"
exit 1
fi

sed -i "" 's,'"${SDK_VERSION}"',0.1.0,' $PODSPEC_PATH
