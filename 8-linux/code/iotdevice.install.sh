sudo bash

cd /opt
unzip iotdevice.zip

cd iotdevice
python3 -m venv env
. env/bin/activate
pip3 install -r requirements.txt

cp iotdevice.service /etc/systemd/system
systemctl disable lightdm

cd /etc/systemd/system/getty@tty1.service
mv autologin.conf autologin.conf.DISABLED
reboot
