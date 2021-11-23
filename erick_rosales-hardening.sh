#!/bin/bash
v=$(hostnamectl|grep Operating)
if [[ $v == *"CentOS"* ]] && [[ $v == *"7"* ]]
then
echo "Its operating system is: CentOS 7  "
v="CentOS 7"
else 
echo "Its operating system is: CentOS 8 "
fi
echo "Press Enter"
read

pkill clamav
sudo yum remove clamav
if [[ $v == "CentOS 7" ]]
then
sudo yum install clamav
else
sudo yum install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm
fi

echo "Press Enter"
read

if [[ $v == "CentOS 7" ]] 
then
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum repolist
echo "Press Enter"
read
fi


sudo yum -y update
