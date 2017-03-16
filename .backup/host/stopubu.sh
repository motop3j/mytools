#!/bin/bash


if [ $# -ne 1 ]; then
	echo Usage: $0 last_octet_of_ipaddress
	exit 1
fi

ipaddress=192.168.10.$1
hostname=ubu$(printf %03d $1)

PATH=/Applications/VirtualBox.app/Contents/MacOS:/usr/bin:/bin

VBoxManage list runningvms | egrep "^\"ubu011\"" 
if [ $? -ne 0 ]; then
	echo $hostname is already stoped.
	exit 1
fi

VBoxManage controlvm $hostname acpipowerbutton




