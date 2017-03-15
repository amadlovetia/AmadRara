echo "Sebastian Rahmad <3 Mutiara Bunda" | tee log-install.txt
echo "===============================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Service"  | tee -a log-install.txt
echo "-------"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://[IP]/client.tar)"  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 109, 110, 443, 80"  | tee -a log-install.txt
echo "Squid3   : 8080, 3128 (limit to IP SSH)"  | tee -a log-install.txt
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
echo "7.) Mengecek Spesifikasi VPS Singkat Beserta Script : spekvps"  | tee -a log-install.txt
echo "8.) Mengecek Spesifikasi VPS Lengkap : benchnetwork"  | tee -a log-install.txt
echo "9.) Mengecek Speed VPS : testspeed"  | tee -a log-install.txt
echo "10.) Merestart VPS : reboot"  | tee -a log-install.txt
echo "11.) Mengecek Penggunaan Ram VPS : usedram"  | tee -a log-install.txt
echo "12.) Melimit User Yang Login Lebih Dari 1 Perangkat : userlimit1"  | tee -a log-install.txt
echo "13.) Melimit User Yang Login Lebih Dari 2 Perangkat : userlimit2"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Fitur lain"  | tee -a log-install.txt
echo "----------"  | tee -a log-install.txt
echo "Webmin   : http://[IP]:10000/"  | tee -a log-install.txt
echo "vnstat   : http://[IP]/vnstat/"  | tee -a log-install.txt
echo "MRTG     : http://[IP]/mrtg/"  | tee -a log-install.txt
echo "OCS      : http://[IP]:2133/"  | tee -a log-install.txt
echo "Timezone : Asia/Jakarta"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "IPv6     : [off]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo -e "Script by \e[1;33;44mSebastian Rahmad\e[0m"
