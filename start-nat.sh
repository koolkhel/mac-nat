networksetup -setmanual "USB Ethernet" 192.168.2.1 255.255.255.0
sudo sysctl -w net.inet.ip.forwarding=1
sudo pfctl -d
sudo pfctl -e -f /etc/pf.conf
# for the file to load, en4 has to be present and active, so run this until 
# it succeeds (device starting in background)
sudo cp usr.home /etc/pf.anchors
sudo /sbin/pfctl -f /etc/pf.anchors/usr.home
while [ ! $? -eq 0 ]; do
	sleep 1
	sudo /sbin/pfctl -f /etc/pf.anchors/usr.home
done
# run in foreground so that Pi's activity is clearly visible
sudo /usr/libexec/bootpd -d -v -D
