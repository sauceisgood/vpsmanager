#/bin/bash

sleep 2

apt-get update -y
clear
yum update -y
apt-get install openssh-server -y
clear
apt-get install curl -y
clear
yum install openssh-server -y
clear
apt-get install openssh-client -y
clear
yum install openssh-client -y
clear
apt-get install stunnel4 -y
clear
yum install stunnel4 -y
clear
apt-get install stunnel -y
clear
yum install stunnel -y
clear

ip=$(curl https://api.ipify.org/)
echo $ip
clear

echo -e "Presione Enter"
sleep 1

openssl genrsa 2048 > stunnel.key
openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt

sleep 2
rm /etc/stunnel/stunnel.conf
clear
rm /etc/default/stunnel4
clear
cat stunnel.crt stunnel.key > stunnel.pem 
mv stunnel.pem /etc/stunnel/
clear
echo -e "\033[1;31mESCRIBA EL PUERTO SSL A UTILIZAR"
read -p ": " port
clear
echo "client = no " >> /etc/stunnel/stunnel.conf
echo "[ssh] " >> /etc/stunnel/stunnel.conf
echo "cert = /etc/stunnel/stunnel.pem " >> /etc/stunnel/stunnel.conf
echo "accept = $port " >> /etc/stunnel/stunnel.conf
echo "connect = 127.0.0.1:22" >> /etc/stunnel/stunnel.conf
sleep 1
echo "ENABLED=1 " >> /etc/default/stunnel4
echo "FILES="/etc/stunnel/*.conf" " >> /etc/default/stunnel4
echo "OPTIONS="" " >> /etc/default/stunnel4
echo "PPP_RESTART=0" >> /etc/default/stunnel4

echo -e "\033[1;33m **********************************"
echo -e "\033[1;31mI N I C I A N D O  -  STUNNEL4"
echo -e "\033[1;33m **********************************"
sleep 1
service ssh restart 1>/dev/null 2 /dev/null
service stunnel4 start 1>/dev/null 2 /dev/null
service stunnel4 restart 1>/dev/null 2 /dev/null
clear
echo -e "\033[1;33m ***********REINICIADO...*************"
clear

echo -e "\033[1;33m **********************************"
echo -e "\033[1;33mCONFIGURA��O SSL CRIADA COM SUCESSO"
echo -e "\033[1;33m **********************************"
echo -e "\033[1;33m- - - - -> \033[01;34MO TEU IP HOST:\033[0m $ip"
sleep 1
echo -e "\033[1;31mReinicie a VPS (Opcional) - sudo reboot"
sleep 2
echo -e "\033[1;33m- - ->>VPS \033[01;34mBY: "
echo -e "\033[1;33m- - ->>Creditos \033[01;34mSaucing"
sleep 2

