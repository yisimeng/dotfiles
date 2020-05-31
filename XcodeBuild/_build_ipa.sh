#!/bin/sh

PROG=`basename $0`

# --------------------------------------------------------------------- #
# usage()                                                               #
# 帮助
#
# --------------------------------------------------------------------- #
usage() {
    cat <<EOF
#***************************************************#
#                  auto_build.sh                    #
#           written by Duan Zengguang               #
#                  Aug 13, 2018                     #
#                                                   #
#                     自动编译                      #
#           cmd project.project target              #
#***************************************************#
    Usage: ${PROG} [OPTION]... PATTERN
        Archive codesign export ipa.
    Example: ${PROG} -p 'proj.xcodeproj' -s 'scheme'
    Options:
        -p, --project           the project launch file
        -w, --workspace         the workspace launch file
        -s, --scheme            the scheme of the project
        -c, --configuration     debug or Release
        -out                    build out path
        -exportPlist            export options plist
        -h, --help              display this help and exit
EOF
    exit $1
}
# 显示帮助
[ "$1" = "" ] && Usage

set -- `getopt -o p:w:s:c:h: -l out:exportPlist: -- "$@"`

echo "param = $@"
while [ -n "$1" ]
do
    case $1 in
        -p|--project)
            project=$2
            echo "project = $2";
            isBuildWorkspace=false
        shift ;;
        -w|--workspace)
            workspace=$2
            echo "workspace = $2";
            isBuildWorkspace=true
        shift ;;
        -s|--scheme)
            scheme=$2
            echo "scheme = $2"
        shift ;;
        -c|--configuration)
            configuration=$2
            echo "configuration = $2"
        shift ;;
        -out|--out_path)
            out_path=$2
            echo "out_path = $2"
        shift ;;
        -exportPlist)
            out_path=$2
            echo "exportPlist = $2"
        shift ;;
        -h)
            usage
        ;;
    esac
shift
done

############################################################

if [ -n $configuration ]
then
configuration="Release"
fi

# build path
archivePath=./build/${scheme}.xcarchive
# exportPath
exportPath=./build/${scheme}
# exportOptionsPath
exportOptionsPath=./ExportOptions.plist

# 清空文件
if [ -d "./build" ]
then
rm -rf "./build"
fi

if [ isBuildWorkspace==true ]
then
build_archive_cmd="xcodebuild archive -project ${project} -scheme ${scheme} -configuration ${configuration} -archivePath ${archivePath} clean build -quiet"
else
build_archive_cmd="xcodebuild archive -workspace ${workspace} -scheme ${scheme} -configuration ${configuration} -archivePath ${archivePath} clean build -quiet"
fi

# 打包
#echo "********开始构建**********"
$build_archive_cmd

if [[ $? -ne 0 ]]; then
echo "构建失败！构建命令：$build_archive_cmd}"
exit 1
fi

# 导出ipa
echo "********导出 ipa*********"
xcodebuild -exportArchive \
-archivePath ${archivePath} \
-exportPath ${exportPath} \
-exportOptionsPlist ${exportOptionsPath} \
-quiet


if [ -e ${exportPath} ]
then
echo "ipa 导出成功：${exportPath}"
else
echo "ipa 导出失败"
exit 1
fi

echo "build end"
