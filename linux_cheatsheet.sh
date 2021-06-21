#!/bin/bash

# cd.. cd ~  cd / 

ls 
#list dirs
ls -l 
# list more info on dirs

ls -r
#reverse order

ls -p 
#shows file types

ls -s 
# shows files by size 

ls /home/samar/Desktop
# shows file on that path

nano example.txt 
#edit file

mkdir example 
touch example.txt
#create dir and file

sudo su 
su $username
#switch and exit superuser shell

apt-cache search prog_name*
apt-cache policy prog_name*
#search for pograms and with repo

apt-get [cmd] [1] [2] [3]
#install uninstall upgrade purge  , packages args

sudo chown $user1:$user2 $file 
#share files with other users 
# user1 becomes owner, user2's group becomes owner
sudo chown $user1 $file
#makes user1 owner of the file



chmod u=rwx,g=rx,o=r myfile
#u permissions to read write execute , u = users
#g perms to read execute, g = group
#o perms to read, o = others

#
#-rwxrw-r-- 1 root  samar   0 Jun 20 10:45 example_file.txt
# permissions can be read write execute
# -rwxrwxrwx  , first rwx is for users, second for groups, third for others

mv $PATH/$FILE $NEW_PATH/$NEW_FILE_NAME
# moves file to specified dir , with option to change filename

mv $DIR_NAME $NEW_DIR_NAME
#renames dir
#
#to copy use cp instead of mv


find $DIR -type [f or d] [-iname or name] $FILE 
# cmd to find files based on names, formats using *
# iname ignores case
# f for files, d for dirs
# can search based on permissions using octal permissions 

find $DIR [-maxdepth 1] -size [+ or -] [* -not] $SIZE_VAR
# fnd based on over or under specific size
# not means execulde optional arg
# max depth remove recursiveness, optional arg

# 
#recursive by default

grep -n $SEARCH_TERM $FILE 
#searches throughs the file for the term specified
#returns value and line no [-i] to ignore case
#[./*] instead of file to search through all files in current dir

find $DIR -type [f or d] [-iname or name] $FILE -exec grep -n $SEARCH_TERM +
# this commands finds a file and exes cmd

> $FILE
#add infront od command to store output in a file


### PROCESSES ###

top
ps aux 
kill -9 $PID
kill all $COMMAND
#top returns top running processes
#ps aux returns all processes
#

# PID - , USER - , PR- , NI- , VIRT -, RES -, SHR -, %CPU, %MEM, TIME+ - , COMMAND
#process id, user,                                                         , Name to grep by pgrep

service $SERVICE_NAME [start or status or restart or stop]
systemctl [start or status or restart or stop] $SERVICE_NAME 

crontab -e 
# create file in minute hour day month weekday command format to run at that specific time
# schedule backups, scripts and all kinda shit. yo!
# path must be absolute
