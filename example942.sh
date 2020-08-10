#!/bin/bash
archivenr=`date +%Y%m%d`
destdir="$pwdarchive-$archivenr"
mkdir "$destdir"
find "$pwd" -type f -a -mtime +5 | while read -d $'\000' file
do
gzip "$file"; mv "$file".gz "$destdir"
echo "$file archived"
done
