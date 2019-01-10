#!/bin/bash

sudo apt-get install git time fping dnsutils zabbix-agent -y

sudo cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.bak
sudo sed -i 's/Server=127.0.0.1/Server=144.214.93.106/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/ServerActive=127.0.0.1/ServerActive=144.214.93.106/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/Hostname=Zabbix server/Hostname=sro-sg03/g' /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/# Timeout=3/Timeout=30/g' /etc/zabbix/zabbix_agentd.conf

sudo wget -O /etc/zabbix/zabbix_agentd.conf.d/sro-wifi.conf 

sudo systemctl restart zabbix-agent

