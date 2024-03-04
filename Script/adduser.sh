#!/bin/bash
username=$1
password=$2
dias=$3
sshlimiter=$4

echo ""

awk -F : ' { print $1 }' /etc/passwd > /tmp/users 
if grep -Fxq "$username" /tmp/users
then
	echo "0";
	exit 1	
else
	if (echo $username | egrep [^a-zA-Z0-9.-_] &> /dev/null)
	then
		echo "1" ;
		exit 1
	else
		sizemin=$(echo ${#username})
		if [[ $sizemin -lt 2 ]]
		then
			echo "2";
			exit 1
		else
			sizemax=$(echo ${#username})
			if [[ $sizemax -gt 32 ]]
			then
				echo "3" ;
				exit 1
			else
				if [[ -z $username ]]
				then
					echo "4" ;
					exit 1
				else	
					
					if [[ -z $password ]]
					then
						echo "5";
						exit 1
					else
						sizepass=10
						if [[ $sizepass -lt 6 ]]
						then
							echo "6" ;
							exit 1
						else	
							
							if (echo $dias | egrep '[^0-9]' &> /dev/null)
							then
								echo "7" ;
								exit 1
							else
								if [[ -z $dias ]]
								then
									echo "8" ;
									exit 1
								else	
									if [[ $dias -lt 1 ]]
									then
										echo "9" ;
										exit 1
									else
										
										if (echo $sshlimiter | egrep '[^0-9]' &> /dev/null)
										then
											echo "10" ;
											exit 1
										else
											if [[ -z $sshlimiter ]]
											then
												echo "11" ;
												exit 1
											else
												if [[ $sshlimiter -lt 1 ]]
												then
													echo "12!" ;
													exit 1
												else
													final=$(date "+%Y-%m-%d" -d "+$dias days")
													gui=$(date "+%d/%m/%Y" -d "+$dias days")
													pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
													useradd -e $final -M -s /bin/false -p $pass $username
													[ $? -eq 0 ] && echo "13" ;
													echo "$password" >/etc/SSHExtra/senha/$username
													echo "$username $sshlimiter" >> /root/usuarios.db
												fi
											fi
										fi
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi
	fi	
fi
