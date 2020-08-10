#!/bin/bash
clear
year=`date | awk '{ print $6 }'`
if [ $[$year % 400] -eq "0" ]; then
   echo "a leap year"
elif [ $[$year % 4] -eq 0 ]; then
        if [ $[$year % 100] -ne 0 ]; then
           echo "This is a leap year"
        else 
           echo "not leap year"
        fi
else
  echo "This is not a leap year"
fi
