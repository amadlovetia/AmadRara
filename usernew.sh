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
echo -e "Host SSH: $IP"
echo -e "Port Dropbear: 443,143,80"
echo -e "Port OpenSSH: 22,143"
echo -e "Port Squid: 8080,3128 (Limit To IP SSH)"
echo -e "Port OpenVPN: 1194"
echo -e "Config OpenVPN: http://$IP:99/client.ovpn"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-----------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "==========================="