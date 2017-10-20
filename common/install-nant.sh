#!/bin/sh	
NANT_VERSION=0.92
NANT_FILENAME=nant-$NANT_VERSION-bin.tar.gz
NANT_FOLDER=nant-$NANT_VERSION

if [ ! -f /home/vagrant/$NANT_FILENAME ]; then
   wget -o /home/vagrant https://downloads.sourceforge.net/project/nant/nant/$NANT_VERSION/$NANT_FILENAME
fi

tar xvf /home/vagrant/$NANT_FILENAME -C /home/vagrant

if [ ! -d /usr/local/nant ]; then
    mkdir /usr/local/nant
fi

cp -r /home/vagrant/nant-0.92/bin/* /usr/local/nant

cat <<-SCRIPT > /usr/local/bin/nant
#!/bin/sh
exec mono /usr/local/nant/NAnt.exe "\$@"
SCRIPT
    
    
