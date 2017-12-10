#!/bin/sh	
NANT_VERSION=0.92
NANT_FILENAME=nant-$NANT_VERSION-bin.tar.gz
NANT_FOLDER=nant-$NANT_VERSION

if [ ! -f /home/vagrant/$NANT_FILENAME ]; then
   wget -O /home/vagrant/$NANT_FILENAME https://downloads.sourceforge.net/project/nant/nant/$NANT_VERSION/$NANT_FILENAME
fi

tar xvf /home/vagrant/$NANT_FILENAME -C /home/vagrant

if [ ! -d /usr/local/nant ]; then
    mkdir /usr/local/nant
fi

cp -r /home/vagrant/nant-$NANT_VERSION/* /usr/local/nant

cat <<-SCRIPT > /usr/local/nant/bin/nant
#!/bin/sh
exec mono /usr/local/nant/bin/NAnt.exe "\$@"
SCRIPT

echo 'export NANT_HOME=/usr/local/nant' >> /home/vagrant/.bash_profile

#cat <<-SCRIPT >> /home/vagrant/.bash_profile
#export NANT_HOME=/usr/local/nant
#SCRIPT

chmod a+x /usr/local/nant/bin/nant

if [ ! -f /usr/bin/nant ]; then
  ln -s /usr/local/nant/bin/nant /usr/bin/nant
fi

cp -f /vagrant_common/NAnt.exe.config /usr/local/nant/bin