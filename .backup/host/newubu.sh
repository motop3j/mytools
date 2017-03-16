#!/bin/bash

if [ $# -ne 1 ]; then
	echo Usage: $0 last_octet_of_ipaddress
	exit 1
fi

ipaddress=192.168.10.$1
hostname=ubu$(printf %03d $1)

PATH=/Applications/VirtualBox.app/Contents/MacOS:/usr/bin:/bin:/sbin

originalvm=Ubuntu14.04_template_201
originalip=192.168.10.201
snapshot=20140906

VBoxManage clonevm $originalvm --snapshot $snapshot --name $hostname --register --options link
VBoxManage startvm $hostname --type headless

echo $hostname is booting...
sleep 20

while true; do
	ping -c 1 $originalip
	if [ $? -eq 0 ]; then
		break
	fi
done

ssh $originalip sudo /opt/vboxutils/init.sh $hostname $ipaddress
$(dirname $0)/stopubu.sh $1
sleep 5
VBoxManage startvm $hostname --type headless
