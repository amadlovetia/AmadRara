#!/bin/bash
#Script Perpanjang User SSH

read -p "Username : " Login
read -p "Penambahan Masa Aktif (hari): " masaaktif
userdel $Login
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "--------------------------------"

echo -e "Akun Sudah Diperpanjang Hingga $exp"
echo -e "==========================="
