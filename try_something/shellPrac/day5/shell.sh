### day5
### requirements:
### there is a dir /data/att/ contains hundreds of subdirs
### such as /data/att/linux
### and the deeper layer all contains dirs named by date, like /data/att/linux/20240822
### each day a new dir named by date will be generate, but dist what /data at is gonna full.
### so we need to move old items (a year before) to another dir /data1/att
### and after that soft link is needed
### for example : ln -s /data1/att/linux/20220808 /data/att/linux/20220808
### notice : you need to ensure old items had been moved to new dir before you execute soft link commands

##################################################################################################
#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-22

## define a main function
main(){
	cd /data/att
	# ergodic the first dir 
	for dir in 'ls'
	do
		for dir2 in $(find $dir -maxdepth 1 -type d -mtime +365)
		do
			## rsync items under target dir to /data1/att, `-R` here can automatically make dir structure
			async -aR $dir2/ /data1/att/
			if [[ $? -eq 0 ]]
			then 
				## if succ async, delete related dir under /data/att/
				rm -rf $dir2
				echo "/data/att/$dir2 移动成功"
				## soft link
				ln -s /data1/att/$dir2 /data/att/$dir2 && \
					echo "/data/att/$dir2 成功创建软连接"
			else 
				echo "/data/att/$dir2 未成功移动"
			fi
		done
	done
}

## use main function and write output into logger
main &> /tmp/move_old_data$(date +%F).log   ## 不需确保文件先创建？
