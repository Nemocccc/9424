#!/bin/bash
#author: nemo
#version: v1
#date: 2024-09-04

#######################################################################
### day12
### write a script that receive parameters to realize files downloading functions, two parameters :
### 1> the first parameter is the file's download link
### 2> the second is the directory that the files downloaded will be contained.
### 3> notice to check if the directory is maked, is not, you need to ask users whether to make a dir
#######################################################################

## make dir
while true:
do
	if [[ -d $2 ]];
	then
		break
	else
		read -p "the dir is not found, make a new one?" affirm
		case affirm in 
			y|Y) 
				mkdir -p $2
				break
				;;
			*)
				exit 1
				;;
		esac
	fi
done

cd $2
wget $1

if [[ $? -eq 0 ]];
then
	echo " download successfully"
	exit 0
else
	echo " fail to download $1"
	exit 1
fi

<<'COMMENT'
nothing new
COMMENT
