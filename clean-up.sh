#!/bin/bash

LOG_DIR=/var/log
ROOT_UID=0 # Only users with $UID 0 have root privileges.
LINES=50 # Default number of lines saved.
E_XCD=86 # Can't change directory
E_NOTROOT=87 # Non-root exit error.

if [ "$UID" -ne "$ROOT_UID" ]
then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

if [ -n "$1" ]
then
    lines=$1
else
    lines=$LINES 
fi

# E_WRONGARGS=85 # Non-numerical argument (bad argument format).
# case "$1" in
# "" ) lines=50;;
# *[!0-9]*) echo "Usage: `basename $0` lines-to-cleanup";
# exit $E_WRONGARGS;;
# * ) lines=$1;;
# esac
#* Skip ahead to "Loops" chapter to decipher all this.
cd $LOG_DIR
if [ `pwd` != "$LOG_DIR" ] 
then
    echo "Can't change to $LOG_DIR."
exit $E_XCD
    fi
# cd /var/log || {
# echo "Cannot change to necessary directory." >&2
# exit $E_XCD;
# }
tail -n $lines messages > mesg.temp 
mv mesg.temp messages
cat /dev/null > wtmp 
echo "Log files cleaned up."
exit 0
