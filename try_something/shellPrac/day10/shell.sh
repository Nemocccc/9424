### day10
### a monitor script, to monitor whether the request to a website is normal
### hint
### 1> provide websites to request in the form of parameters, for example: sh xxx.sh www.baidu.com
### 2> request normal when status code receive 2XX or 3XX
### 3> echo working when normal, otherwise echo not well

####################################################################
#!/bin/bash
#author: nemo
#version: v1
#date: 23-08-31
####################################################################

## check if the device contains `curl` command
if ! where curl &> /dev/nul
then
	echo "the divice had not yet installed curl"
	## assume that it is a ubuntu system
	apt install -y curl
	if [[ $? -eq 0 ]]
	then 
		echo "fail to install curl"
		exit 1
	fi
fi

code=$(curl --connect-timeout 3 -I $1 2>/dev/null | grep 'HTTP' | awk '{ print $2 }'
if echo $code | grep -qE '^2[0-9][0-9]|^3[0-9][0-9]'
then
	echo 'access to $1 work normal'
else
	echo 'access to $1 work nor well'
fi

<<'COMMENT'
1. ^ on the head of a regex line meanns it only matches content on the head of text
2. grep -q : quiet mode, telling grep do not print any results
3. grep -E : extend regex usage
COMMENT
