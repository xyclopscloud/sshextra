#!/bin/bash

user=$1
password=$2

if [[ $(grep -c /$user: /etc/passwd) -ne 0 ]]; then
	sizepass=$(echo ${#password})
	if [[ $sizepass -lt 4 ]]; then
		echo "2"
		exit 1
	else
		ps x | grep $user | grep -v grep | grep -v pt >/tmp/rem
		if [[ $(grep -c $user /tmp/rem) -eq 0 ]]; then
			echo "$user:$password" | chpasswd
			echo "1"
			echo "$password" >/etc/SSHExtra/senha/$user
			exit 1
		else
			echo "1"
			pkill -f $user
			echo "$user:$password" | chpasswd
			echo "$password" >/etc/SSHExtra/senha/$user
			exit 1
		fi
	fi
else
	echo "0"
	exit 1
fi
