#!/bin/bash
ps –e | grep ‘httpd’ | wc –l
if [ $? –eq 0 ]
then
      echo “The machine is running websever”
else
      echo “not running”
fi

