#!/bin/bash
array=($(ls -l | while read line
do
awk '{ print $9 }'
done))
IFS='
' read -d '' -a arr < <(ls -l | sed '1d')
mapfile -t result < <(for m in "${array[@]}"; do
		
        if [ -d "$m" ]; then
                printf '%s\n' "$m is a directory"
        elif [ -f "$m" ]; then
                printf '%s\n' "$m is a regular file"
        else
                printf '%s\n' "$m is a special type of file"
        fi
     done)
n=${#arr[@]}
for ((i=0; i<n; i++))
do
COMB[$i]=${arr[$i]}" - ["${result[$i]}"]"
echo ${COMB[$i]}
done
