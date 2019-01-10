#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: make-kiosk.sh [url]"
    echo "Excample: make-kiosk.sh https://www.google.com/"
    exit 1
fi

URL=$1
KIOSKPATH=/home/pi/kiosk.sh

echo "===Install tools and remove unwanted packages==="

sudo apt-get update
sudo apt-get install xdotool unclutter sed

sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt-get clean
sudo apt-get autoremove -y

sudo apt-get upgrade -y

echo "===Create kiosk.sh==="

sudo rm -rf $KIOSKPATH
cat <<EOT > $KIOSKPATH
#!/bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk $URL &

EOT

echo "===Update /home/pi/.config/lxsession/LXDE-pi/autostart==="

sudo sed -i 's/@xscreensaver -no-splash/#@xscreensaver -no-splash/g' /home/pi/.config/lxsession/LXDE-pi/autostart

echo "@bash $KIOSKPATH" >> /home/pi/.config/lxsession/LXDE-pi/autostart

sudo reboot

