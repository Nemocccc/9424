### day8
### write a script to realize the functions bellow
### input a number and realize relate function
### and you should output some text like :
### *cmd command* : 1-date 2-ls 3-who 4-pwd q-quit
### when input 1, execute `date`, when input 2, execute pwd, etc.

################################################################
#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-29
################################################################

while :
do
	read -p "*cmd commands*: 1-date, 2-ls, 3-who, 4-pwd, q-quit" choice
	case $choice in
		1) 
			date
			;;
		2)
			ls
			;;
		3)
			who
			;;
		4) 
			pwd
			;;
		"q")
			break
			;;
		*)
			echo "you fuck choosing nothing"
			break
			;;
	esac
done

<<'COMMENT'
case and esac
break and ;;
COMMENT
