### day3:
### write a detect script to detect whether write and read function of all dists of computer are all right.
### hint: ergodic all mount points and make a testfile there
### then delete the testfile, if new and del files normally, the dist is ok

###################################################################################################

#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-20

for mount_p in $(df | sed '1d' | grep -v 'tmpfs' | awk '{print $NF}')
do
	touch $mount_p/testfiles && rm -f $mount_p/testfile
	if [[ $? -ne 0 ]]
	then 
		echo "$mount_p 读写有问题"
	else 
		echo "$mount_p 读写正常"
	fi
done
