#!/usr/local/bin/bash

# 工程名称
project=$1
# Debug/Release
configuration=$2

# build path
buildPath=~/Desktop/build/${project}.xcarchive

# exportPath
exportPath=~/Desktop/build

# exportOptionsPath
exportOptionsPath=./exportOptions.plist

# 打包
echo "********开始打包**********"
xcodebuild archive \
-project ${project}.xcodeproj \
-scheme ${project} \
-configuration configuration \
-archivePath ${buildPath} \
clean \
build \
-quiet

if [ -e ${buildPath} ]
then
echo "********打包完成********"
echo "文件位置：${buildPath}"
else
echo "****打包完成文件不存在****"
exit
fi

# 导出ipa
echo "********开始导出*********"
xcodebuild -exportArchive \
-archivePath ${buildPath} \
-configuration ${configuration} \
-exportPath ${exportPath} \
-exportOptionsPlist ${exportOptionsPath} \
-quiet
if [ -e ${exportPath} ]
then
echo "*****ipa已导出******"
echo "ipa路径：${exportPath}"
else 
echo "*****ipa未导出******"
fi
echo "脚本执行结束"
