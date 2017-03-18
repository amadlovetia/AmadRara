#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;

flag=0

echo

function usernew() {
#!/bin/bash
#Script auto create SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH"
echo -e "=========-account-=========="
echo -e "Host: $IP"
echo -e "Port: 443,143,80"
echo -e "Squid: 8080, 3128"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-----------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "==========================="
echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
}

function perpanjang() {
#!/bin/bash
#Script Perpanjang User SSH

read -p "Username : " Login
read -p "Password Baru : " Pass
read -p "Penambahan Masa Aktif (hari): " masaaktif
userdel $Login
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "--------------------------------"

echo -e "Akun Sudah Diperpanjang Hingga $exp"
echo -e "Password telah diganti dengan $Pass"
echo -e "==========================="
echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
}

function hapususer(){
#!/bin/bash
#Script Delete Akun Modified by Sebastian Rahmad
echo ""
echo "  Selamat Datang Di Hapus User  "
echo ""
echo "--------------------------------"
echo "USERNAME             EXP DATE   "
echo "--------------------------------"
while read mumetndase
do
        AKUN="$(echo $mumetndase | cut -d: -f1)"
        ID="$(echo $mumetndase | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
        fi
done < /etc/passwd
echo "--------------------------------"
echo ""
read -p "Isikan Username : " Login
userdel $Login
echo ""
echo "Akun $Login berhasil dihapus"
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo ""
echo "--------------------------------"
echo "Jumlah akun: $JUMLAH user"
echo "--------------------------------"
echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
}

function cekuser(){
	#!/bin/bash
echo "-------------------------------"
echo "USERNAME          EXP DATE     "
echo "-------------------------------"
while read expired
do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
        fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------"
echo "Jumlah akun: $JUMLAH user"
echo "-------------------------------"
echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
}

function userexp(){
	cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
	totalaccounts=`cat /tmp/expirelist.txt | wc -l`
	for((i=1; i<=$totalaccounts; i++ )); do
		tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
		username=`echo $tuserval | cut -f1 -d:`
		userexp=`echo $tuserval | cut -f2 -d:`
		userexpireinseconds=$(( $userexp * 86400 ))
		todaystime=`date +%s`
		if [ $userexpireinseconds -lt $todaystime ] ; then
			echo $username
		fi
	done
	rm /tmp/expirelist.txt
}

function useraktif(){
    cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
    totalaccounts=`cat /tmp/expirelist.txt | wc -l`
    for((i=1; i<=$totalaccounts; i++ )); do
        tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
        username=`echo $tuserval | cut -f1 -d:`
        userexp=`echo $tuserval | cut -f2 -d:`
        userexpireinseconds=$(( $userexp * 86400 ))
        todaystime=`date +%s`
        if [ $userexpireinseconds -gt $todaystime ] ; then
            echo $username
        fi
    done
	rm /tmp/expirelist.txt
}

function useddata(){
	myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`
	myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`
	ifconfig $myint | grep "RX bytes" | sed -e 's/ *RX [a-z:0-9]*/Received: /g' | sed -e 's/TX [a-z:0-9]*/\nTransfered: /g'
}

function squid () {
	apt-get update
	wget https://raw.githubusercontent.com/sean54321/AmadRara/master/squid.sh
	bash squid.sh
}	

function testspeed () {
	wget https://raw.githubusercontent.com/sean54321/AmadRara/master/Speed-Test.sh
	cp /root/Speed-Test.sh /usr/bin/testspeed
	chmod +x /usr/bin/testspeed
}

function usedram(){
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Copyright 2012-2016 Matt Martz
# All Rights Reserved.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

import warnings

DEPRECATED_MSG = ('The file speedtest_cli.py has been deprecated in favor of '
                  'speedtest.py\nand is available for download at:\n\n'
                  'https://raw.githubusercontent.com/sivel/speedtest-cli/'
                  'master/speedtest.py')


if __name__ == '__main__':
    raise SystemExit(DEPRECATED_MSG)
else:
    try:
        from speedtest import *
    except ImportError:
        raise SystemExit(DEPRECATED_MSG)
    else:
        warnings.warn(DEPRECATED_MSG, UserWarning)
		}

clear
echo ""Script by \e[1;33;44mSebastian Rahmad\e[0m"

echo "For support: KeluargaSSH"
echo "Website: ( Keluarga SSH VPN VPS )"
echo "Email: pramadan99@gmail.com"
echo "My Facebook: https://www.facebook.com/sebastian.rahmad.26"
echo "SMS/Telegram/Whatsapp: 081268428112"

";
PS3='Please enter your choice: '
options=("Add User" "Renew User" "Delete User" "User List" "Trial" "Test Speed VPS"  "Users Not Expired" "Expired Users" "Restart Server" "Change Password" "Used Data By Users" "Used Ram VPS" "Ram Status" "Monitor Multi Login" "Change OpenVPN Port" "Change Dropbear Port" "Change Squid3 Port" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Add User")
            usernew
			break
            ;;
        "Renew User")
            perpanjang
            break
            ;;
        "Delete User")
            hapususer
            break
            ;;		
		"User List")
            cekuser
            break
            ;;
		"Trial")
			#!/bin/bash
			echo -e ""
			echo -e "----- Trial -----"
			Login=trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
			masaaktif="1"
			Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`
			IP=`dig +short myip.opendns.com @resolver1.opendns.com`
			useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
			echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
			echo -e "Host: $IP"
			echo -e "Port: 443,143,80"
			echo -e "Username: $Login "
			echo -e "Password: $Pass\n"
			echo -e ""
			echo -e "Akun ini hanya aktif 1 hari"
			echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
			break
			;;
		"Test Speed VPS")
			testspeed
			break
			;;
		"Users Not Expired")
			useraktif
			break
			;;
		"Expired Users")
			userexp
			break
			;;		
		"Restart Server")
			reboot
			break
			;;	
		"Change Password")
			passwd
			break
			;;
		"Used Data By Users")
			useddata
			break
			;;
		"Used Ram VPS")
			usedram
			break
			;;
		"Ram Status")
		    free -h | grep -v + > /tmp/ramcache
            cat /tmp/ramcache | grep -v "Swap"
            break
            ;;
        "Monitor Multi Login")
            monssh
    		break
	        ;;
		"Change OpenVPN Port")	
            echo "What OpenVPN port would you like  to change to?"
            read -p "Port: " -e -i 1194 PORT
            sed -i "s/port [0-9]*/port $PORT/" /etc/openvpn/1194.conf
            service openvpn restart
            echo "OpenVPN Updated : Port $PORT"
			break
			;;
		"Change Dropbear Port")	
            echo "What Dropbear port would you like to change to?"
            read -p "Port: " -e -i 443 PORT
            sed -i "s/DROPBEAR_PORT=[0-9]*/DROPBEAR_PORT=$PORT/" /etc/default/dropbear
            service dropbear restart
            echo "Dropbear Updated : Port $PORT"
			break
			;;
        "Change Squid3 Port")	
            bash squid
			break
			;;			
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
