#!/bin/bash
clear
echo -n "Please enter new username: "
read username
echo -n "Please enter password for him: "
read password
if [ $(id -u) -eq 0 ]; then                                #-eq = or RAVNO
   egrep "^username" /etc/passwd >/dev/null
   if [ $? -eq -0 ]; then
   echo "$username exists!"
   exit 1
   else
   pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p $pass $username
                mkdir /home/$username
                usermod -d /home/$username $username
                #usermod -g example_group
		[ $? -eq 0 ] && echo "User $username has been added to system!" || echo "Failed to add a user!"
	fi
else
   echo "Only root may add a user to system"
   exit 2
fi   
