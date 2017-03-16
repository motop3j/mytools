#!/bin/bash


if [ $# -ne 1 ]; then
	echo Usage: $0 last_octet_of_ipaddress
	exit 1
fi

ipaddress=192.168.10.$1
hostname=ubu$(printf %03d $1)

PATH=/Applications/VirtualBox.app/Contents/MacOS:/usr/bin:/bin

VBoxManage list runningvms | egrep "^\"ubu011\"" 
if [ $? -eq 0 ]; then
	echo $hostname is already running
	exit 1
fi

VBoxManage startvm $hostname -type headless

