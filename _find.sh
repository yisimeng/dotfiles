#!/bin/sh

_find(){
    find $2 -name "$1" | while read i
do
	echo $i
done
}
