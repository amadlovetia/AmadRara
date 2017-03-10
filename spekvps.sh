echo "Sebastian Rahmad <3 Mutiara Bunda" | tee log-install.txt
echo "===============================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Service"  | tee -a log-install.txt
echo "-------"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP/client.tar)"  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 109, 110, 443, 80"  | tee -a log-install.txt
echo "Squid3   : 8080 (limit to IP SSH)"  | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Tools"  | tee -a log-install.txt
echo "-----"  | tee -a log-install.txt
echo "axel"  | tee -a log-install.txt
echo "bmon"  | tee -a log-install.txt
echo "htop"  | tee -a log-install.txt
echo "iftop"  | tee -a log-install.txt
echo "mtr"  | tee -a log-install.txt
echo "nethogs"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Script"  | tee -a log-install.txt
echo "------"  | tee -a log-install.txt
echo "1.) Membuat Akun SSH/VPN : usernew"  | tee -a log-install.txt
echo "2.) Menghapus Akun SSH/VPN : hapususer"  | tee -a log-install.txt
echo "3.) Mengecek Seluruh Akun Dan Masa Aktif SSH/VPN : cekuser"  | tee -a log-install.txt
echo "4.) Mengecek Akun SSH/VPN Yang Login Menggunakan Dropbear, OpenSSH : userlogin"  | tee -a log-install.txt
echo "5.) Membuat Akun Trial SSH/VPN : trial"  | tee -a log-install.txt
echo "6.) Memperpanjang Akun SSH/VPN : perpanjang"  | tee -a log-install.txt
echo "7.) Mengecek Spesifikasi VPS : benchnetwork"  | tee -a log-install.txt
echo "8.) Mengecek Speed VPS : testspeed"  | tee -a log-install.txt
echo "9.) Merestart VPS : reboot"  | tee -a log-install.txt
echo ""
echo ""  | tee -a log-install.txt
echo "Fitur lain"  | tee -a log-install.txt
echo "----------"  | tee -a log-install.txt
echo "Webmin   : https://$MYIP:10000/"  | tee -a log-install.txt
echo "vnstat   : http://$MYIP/vnstat/"  | tee -a log-install.txt
echo "MRTG     : http://$MYIP/mrtg/"  | tee -a log-install.txt
echo "OCS      : HTTP://$MYIP:2133/"  | tee -a log-install.txt
echo "Timezone : Asia/Jakarta"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "IPv6     : [off]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Log Installasi --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
