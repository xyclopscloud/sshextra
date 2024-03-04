#!/bin/bash
USR_EX=$1
array=(${USR_EX//:/ })
arraylenght=${#array[@]}

function _getUserEx(){
grep "^$1\:x\:" /etc/passwd | \
cut -d ':' -f 1 | \
wc -c | \
sed 's/[^0-9]//g'
}

status=""

for ((i=0;i<${arraylenght}; i++));
do
user=${array[$i]}

if [ -z "${user}" ]; then
status+="0"

else
if [ $( _getUserEx $user ) -gt 3 ]; then
kill -9 `ps -fu $user | awk '{print $2}' | grep -v PID` >/dev/null 2>&1
userdel $user
status+="1"
grep -v ^$user[[:space:]] /root/usuarios.db > /tmp/ph ; cat /tmp/ph > /root/usuarios.db
else
status+="2"
fi
fi

done

echo $status
