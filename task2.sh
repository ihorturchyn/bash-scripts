#!/bin/bash
echo -n "Please enter search word: "
read $sw
if [[ `expr$# -lt 1 || $# -gt 1` ]]; then
   echo "you entered wrong num of dir"
fi
      
if [ -d $sw ]
then
   echo "you are entered directory"
else
   if [ -f $sw ]
   then
       echo "you entered file"
   fi
fi

output=$(find / -type d -name "opt" -print -mtime 60 | sort -rnk5 | head -5)
echo "$output"

