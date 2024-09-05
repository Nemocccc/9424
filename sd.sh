#!/bin/bash

while :
do
	echo "what to do?"
	echo "1 -> enter docker"
	echo "2 -> so some shell practice"

	read -p "enter your choice: " choice
	case $choice in
		1)
    			cd /DATACENTER1/zixing.liao/try_something/config/
    			docker-compose ps | grep Up > /dev/null 2> /dev/null
		    	if [[ "$?" -eq 0 ]]; then 
			       	docker exec -it anything_ubuntu22basic_image bash
		    	fi
			break
			;;
		2)
			cd try_something/shellPrac/
			echo "$(pwd)"
			read -p "which day? : " daynum
			if [[ -d "day$daynum" ]];
			then
				cd day"$daynum" #wrapped by "" is very important.
				vim shell.sh
			else
				mkdir day"$daynum"
				cd day"$daynum"
				touch shell.sh
				vim shell.sh
			fi
			break
			;;
		*)
			echo "your input means nothing."
			;;
	esac
done
