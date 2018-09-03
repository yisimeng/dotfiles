#!/bin/sh
# 编译framework
# 在项目目录下调用
#cmd xxx.podspec 0.1.1

set -e

# .podspec
PODSPEC_PATH=$1
# SDK名称
SDK_NAME=$(basename $PODSPEC_PATH .podspec)
# 版本
SDK_VERSION=$2
# 仓库
GIT_PATH=$PWD
# framework目录
FRAMEWORK_PATH=$SDK_NAME"-"$SDK_VERSION"/ios/"$SDK_NAME".embeddedframework"

# 修改版本号/git路径
sed -i "" 's,0.1.0,'"${SDK_VERSION}"',' $PODSPEC_PATH
sed -i "" 's,git repository,'"${GIT_PATH}"',' $PODSPEC_PATH

# 提交到本地仓库
if [ -e .git ]
then
echo "repository exist"
else
git init
fi
git add .
git commit -m 'modify version,git repository'

echo "build begin"

# 移除缓存
rm -fr ~/Library/Caches/CocoaPods/Pods/External/'${SDK_NAME}'

# 编译
pod package $PODSPEC_PATH --embedded --force

# 测试是否编译成功
if [ -e $FRAMEWORK_PATH ]
then
echo "build framework success: ${FRAMEWORK_PATH}"
else
echo "build framework failure"
fi
