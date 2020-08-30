#!/bin/bash

#variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet|  head -1 | tail -2)
suids=($find / -type f -perm /4000)


#check if directory exists , and create if it does not
if [ ! -d $HOME/research ]
then
	mkdir $HOME/research
fi


#remove old file
if [-f $output ]
then
	rm $output
fi


echo "A Quick System Audit Script"
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "$ip \n" >> $output
echo "Hostname: $(hostname -s) " >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo "Memory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who) \n" >> $output
echo

#echo "$(date)"
#echo "$(uname)"
#echo "$(hostname)"

#mkdir ~/research_commands
#echo sudo find / -type f -perm /4000 > ~/research_commands/sys_info.txt
#ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research_commands/sys_info.txt







