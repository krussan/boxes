#!/bin/sh
#Install guest additions
wget -c http://download.virtualbox.org/virtualbox/5.1.2/VBoxGuestAdditions_5.1.2.iso -O /opt/VBoxGuestAdditions_5.1.2.iso
mount VBoxGuestAdditions_5.1.2.iso -o loop /mnt
/mnt/VBoxLinuxAdditions.run --nox11
rm /opt/*.iso
/etc/init.d/vboxadd setup
chkconfig --add vboxadd
chkconfig vboxadd on
