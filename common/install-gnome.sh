#/bin/sh
	#### This installs a minimal installation of gnome
yum groupinstall "X Window System" -y

#GNOME
yum install gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts dejavu-sans-mono-fonts -y 

#### Override gnome setup
mkdir /home/vagrant/.config
echo "yes" >> /home/vagrant/.config/gnome-initial-setup-done	
chown -R vagrant:vagrant /home/vagrant/.config

#LIGHTDM
#yum install -y cinnamon gnome-icon-theme-legacy.noarch
#yum groupinstall Fonts
#echo "exec /usr/bin/cinnamon-session" >> /home/vagrant/.xinitrc

#### Enable boot into graphical interface
systemctl set-default graphical.target

