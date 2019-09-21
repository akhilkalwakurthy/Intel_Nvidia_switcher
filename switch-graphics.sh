if [ "$1" = "" ]; then
	echo "Attention! No gpu specified, assuming intel"
	set $1 "intel"
fi

echo "Copying $1-xorg.conf..."
if [ -f /etc/X11/xorg.conf ]; then
	sudo rm /etc/X11/xorg.conf
fi
sudo cp /home/akhil/$1-xorg.conf /etc/X11/xorg.conf
echo "Copying $1-Xsetup..."
if [ -f /usr/share/sddm/scripts/Xsetup ]; then
	sudo rm /usr/share/sddm/scripts/Xsetup
fi
sudo cp /home/akhil/$1-Xsetup /usr/share/sddm/scripts/Xsetup
sudo chmod +x /usr/share/sddm/scripts/Xsetup

echo "Logout and re-login to switch to $1 GPU"
# qdbus org.kde.ksmserver /KSMServer logout 1 0 0
