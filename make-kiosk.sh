#!/bin/bash

echo $1;

echo "===Remove Unwanted Packages==="
sudo apt-get install xdotool unclutter sed

sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt-get clean
sudo apt-get autoremove -y

sudo apt-get update
sudo apt-get upgrade -y



