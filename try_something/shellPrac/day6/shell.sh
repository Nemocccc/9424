### day6
### a monitor script, monitor loads of system. if system loads over 10, need to log system status infomation
### hint:
### 1> use uptime to see loads of system in past 10 minutes
### 2> use top, vmstat, ss ... to tag system status
### 3> you are required to check it once each 20 seconds
### 4> the infomation of system status need to be saved at /opt/logs/, keeps for a month, filename is recommanded to contain `date + %s` suffix or prefix

########################################################################################################
#!/bin/bash
#author: nemo
#version: v1
#date: 2024-08-23

## first check whether /opt/logs exists, if not, new one.
[[ -d /opt/logs ]] || mkdir -p /opt/logs

## while
while :
do
	##get loads of system per minute, and only take the number before the decimal point
	load=$(uptime | awk -F 'average:' '{print $2}' | cut -d',' -f1 | sed 's/ //g' | cut -d. -f1)
	if [[ $load -gt 10 ]]
	then
		## seperate record the execute result of top, vmstat and ss
		top -bn1 | head -n 100 > /opt/logs/top.$(date +%s)
		vmstat 1 10 > opt/logs/vmstat.$(date +%s)
		ss -an > /opt/logs/ss.$(date +%s)
	fi
	## wait 20 seconds
	sleep 20
	## find and delete logs 30 days before.
	find /opt/logs \( -name "top*" -o  -name "vmstat*" -o -name "ss*" \) -mtime +30 | xargs rm -f
done
