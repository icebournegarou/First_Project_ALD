#!/bin/bash

# Quick setup script for a new server

#Run as root

if [ ! $UID -ne -]
then
echo "Please run this script with sudo."
  exit
fi

#And a log file to write to

log_file=/var/log/setup_script.log

#Log File Header
echo "Log file for general server setup script" >> $log_file
echo "######################" >> $log_file
echo "Log generated on: $(date)" >> $log_file
echo "######################" >> $log_file
echo "" >> $log_file

#Packages needed on the system

packages=(
  'nano'
  'wget'
  'net-tools'
  'python'
  'tripwire'
  'tree'
  'curl'
)

#Check for packages and install if needed
for package in ${packages[@]}
do
  if [! $(which $package) };
  then
    apt install -y $package
  fi
done

#Make sure it worked and log it
echo "$(date) Installed needed packages: ${packages[@]}" | tee -a $logfile

#Harden the system

usermod -s /sbin/nologin root
usermod -L root

echo "$(date) Disabled root shell.  Root user cannot login." | tee -a $log_file

chmod 600 /etc/shadow
chmod 600 /etc/gshadow
chmod 644 /etc/group
chmod 644 /etc/passwd

echo "$(date) Changed permissions on sensitive /etc files." | tee -a $log_file

echo "$(date) Script Finished.  Exiting."
echo "$(date) Script Finished.  Exiting." >> $log_file

exit
