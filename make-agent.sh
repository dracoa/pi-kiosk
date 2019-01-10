#!/bin/bash

if [ $# -ne 3 ]
  then
    echo "Usage: make-agent.sh [hostname] [eap-identity] [eap-password]"
    echo "Excample: make-agent.sh ABC01 peter 123456"
    exit 1
fi


#sudo apt-get install git time fping dnsutils zabbix-agent -y

#sudo cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bak
#sudo sed -i 's/Server=127.0.0.1/Server=144.214.93.106/g' /etc/zabbix/zabbix_agentd.conf
#sudo sed -i 's/ServerActive=127.0.0.1/ServerActive=144.214.93.106/g' /etc/zabbix/zabbix_agentd.conf
#sudo sed -i -e "s/Hostname=Zabbix server/Hostname=$1/g" /etc/zabbix/zabbix_agentd.conf
#sudo sed -i 's/# Timeout=3/Timeout=30/g' /etc/zabbix/zabbix_agentd.conf

#sudo wget -O /etc/zabbix/zabbix_agentd.conf.d/sro-wifi.conf https://raw.githubusercontent.com/dracoa/pi-kiosk/master/sro-wifi.conf

#sudo systemctl restart zabbix-agent

sudo wget -O /etc/wpa_supplicant/wpa_supplicant.conf https://raw.githubusercontent.com/dracoa/pi-kiosk/master/wpa_supplicant.conf
sudo sed -i -e "s/uid/$2/g" /etc/wpa_supplicant/wpa_supplicant.conf
sudo sed -i -e "s/pwd/$3/g" /etc/wpa_supplicant/wpa_supplicant.conf


