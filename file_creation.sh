#!/bin/bash
#input=0
echo "Plese enter name of new file: "
read filename
if [ $filename ]; then
   if [ -f "$(pwd)/$filename" ]; then
       echo "File already exists!"
       exit 0
   else
       touch $(pwd)/$filename
       chmod +x $(pwd)/$filename
       echo "File created. Please check"
       exit 0
   fi
else
  echo "You put emptiness. Please rerun .sh script"
  exit 1
fi
