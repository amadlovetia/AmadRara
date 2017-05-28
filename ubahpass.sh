#!/bin/bash

read -p "Isikan Username : " Login
read -p "Password Baru : " Pass
		passwd $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "--------------------------------"
echo -e "Password telah diganti dengan $Pass"
echo -e "==========================="
