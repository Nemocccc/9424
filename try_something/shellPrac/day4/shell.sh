### day4
### check all files and dir under /DATACENTER1/zixing.liao/try_something/shellPrac/day4 if they satisfy situations bellow
### 1) authorities of files are 644
### 2) authorities of dirs are 755
### 3) files and dirs are owned by zixing.liao, groups are zixing.liao
### if not satisfy, adapt them to be satisfied
### notice: do not change authorities directly, instead process foe judging is needed

#################################################################################################

#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-21

cd /DATACENTER1/zixing.liao/try_something/shellPrac/day4
## ergodic all files and dirs, use 'find .' is enough.
for f in $(find .)
do
	## see authority
	f_p=$(stat -c %a $f)
	## see owner
	f_u=$(stat -c %U $f)
	## see group
	f_g=$(stat -c %G $f)

	if [[ -d $f ]]
	then
		[[ $f_p != '755' ]] && chmod 755 $f  # [[]] here is a method for addition check, notice '&&', if expression in [[]] fail, the commands behind && will not be executed. [[]] only used for expression, assignment and commands is not allowed.
	else
		[[ $f_p != '644' ]] && chmod 644 $f
	fi

	[[ $f_u != 'zixing.liao' ]] && chmod zixing.liao $f
	[[ $f_g != 'zixing.liao' ]] && chmod :zixing.liao $f  # :groups
done

###################################################################################################

<< 'COMMENT'
other way, find is ready to solve the problem
find /.../day4 -type d ! prem 755 -exec chmod 755 {} \;
find /.../day4 ! -type d ! -prem 644 -exec chmod 644 {} \;
find /.../day4 ! -user zixing.liao -exec chown zixing.liao {} \;
find /.../day4 ! -group zixing.liao -exec chgrp zixing.liao {} \;

compare with the former script, which just need to `find` once, this one need four times,
if the number of files is large, the efficiency is bad.

COMMENT
