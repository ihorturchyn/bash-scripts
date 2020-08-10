#!/bin/bash
clear
arg_num=$#
if [ $arg_num -gt 0 ]; then    #-gt означает больше
   echo "Usage: ./homeback.sh "
   exit
fi
free_space=`df /home/backup | tail -1 | awk '{ print $4}'`
user_choice=0
echo "0-full backup, 1-incremental backup. Your choice: "
backup_file_name="backup"$(date +%Y-%m-%d)".tar.gz
read user_choice
case $user_choice in
     0)
     echo "starting to perform"
     ;;
     1)
     echo "perfome incremental"
     if [ -f "/home/backup/backup.tar.gz" ]
     then
       LAST_BACK_TIME=`stat /home/backup/backup.tar.gz |grep Modify|awk -F. '{print $1}' |awk '{print $2" "$3}'`
       LAST_BACK_TIME=`date -d "$LAST_BACK_TIME" +%s`
       now=`date -d "-7 day" +%s`
       if [ $LAST_BACK_TIME -gt $now]
       then
       echo "you cannot do backuping"
       echo "the last backup is on" `date -d @"$LAST_BACK_TIME" +%Y-%m-%d`
       exit
       fi
      fi
      ;;
     *) 
      echo "wrong operation"
      exit
      ;;
esac

tar -cvf $backup_file_name *.sh
backup_file_size=`ls -la $backup_file_name | awk '{ print $5}' `
if [ $backup_file_size -gt $free_space] 
then
   echo "не хватает места в /home/backup, нужно $backup_file_size bytes"
   exit 
fi

mv $backup_file_name /home/backup/backup.tar.gz
