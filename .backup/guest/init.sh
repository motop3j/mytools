#!/bin/bash
#-------------------------------------------------------------------------------
# initialized deployment server
#-------------------------------------------------------------------------------

if [ $# -ne 2 ]; then
	echo Usage: $0 hostname eth1_ipaddress
	exit 1
fi

hostname=$1
address=$2

hosts_file=$INIT_ROOTDIR/etc/hosts
hostname_file=$INIT_ROOTDIR/etc/hostname
interfaces_file=$INIT_ROOTDIR/etc/network/interfaces

if [ ! -w "$hosts_file" ]; then
	echo permission denied: $hosts_file
	exit 1
fi

# /etc/hostname
echo $hostname > "$hostname_file"

# /etc/hosts
echo "127.0.0.1	localhost
127.0.1.1	$hostname
" > "$hosts_file"

# /etc/network/interfaces
echo "auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address $address
	netmask 255.255.255.0
" > "$interfaces_file"



