### day7
### there is a server serve for web application, and there is a dir(/data/web/attachment)
### will irregularly lead some new file from users, but we dont know when users will upload.
### so we need to do a detection each 5 minutes if there have new files genrate
### if have new files, you need to output the new files list to a log named by %Y%m%d%H%M
### hint && ways:
### need a plan task and execute each 5 minutes.
### use find to detect new files.
### so we can check the lines of output of command `find` to see if lines counts more then 0.

######################################################################################################
#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-27

## log name, contains years, months, days, hours and minutes
d=$(date +%Y%m%d%H%M)
basedir=/data/web/attachment

## find
find $basedir/ -type f -mmin -5 > /tmp/newf.txt

## if the file have content, change the name to meet the rewquirement
if [[ -s /tmp/newf.txt ]];
then
	/bin/mv /tmp/newf.txt /tmp/$d
fi
