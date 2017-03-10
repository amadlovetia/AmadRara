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
