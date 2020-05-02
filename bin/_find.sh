#!/bin/sh

_find(){
	find $2 -name "*.$1" | while read i
do
	echo $i
done
}
find $2 -name "*.$1" | while read i
do
echo $i  #显示文件名称
done
