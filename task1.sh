#!/bin/bash
clear
echo "This script will make extra copy of each directory and file"
echo "Give the directory like:/home/user/Desktop/anuj"
read a
cd $a 2>/dev/null
test -d $a 2>/dev/null
if [ $? -eq 0 ]
then
echo "$a Dir exists"
a=`ls -l|grep "^d" | cut -c47- | wc -l`
echo "$a dir found. You wana proced for dir section ? pess y "
read a
        if [ $a == "y" ]
        then
        a1=`ls -l|grep "^d" | cut -c47-`
        for i in $a1
        do
        sudo cp -rv "$i" "$i".original 2>/dev/null
        done
        echo "all done for dir portion . now we will copy files .  press y to pressed"
        read a
           if [ $a == "y" ]
           then
           b=`ls -l|grep "^-" | cut -c47- | wc -l`
           echo "$b file are present"
           b1=`ls -l|grep "^-" | cut -c47-`
           for i in $b1
           do
           sudo cp -rv "$i" "$i".original 2>/dev/null
           done
           echo "all done Thanks"
           else
           echo "As u did not pressed y so we will quit . Start from begining press $0"
           fi
        else
        echo "As u did not pressed y so we will quit .But all directries are coppied. Start from begining press $0"
        fi
else
echo "No $a such dir " 
fi
