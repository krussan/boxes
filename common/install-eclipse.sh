#/bin/sh
ECLIPSE_FILENAME=eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz
if [ ! -d /opt/eclipse ]; then
    if [ ! -f /opt/$ECLIPSE_FILENAME ]; then
		wget http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/oxygen/R/$ECLIPSE_FILENAME -P /opt -nv
	fi
	
	tar xvf /opt/$ECLIPSE_FILENAME -C /opt

	chmod -R +r /opt/eclipse
	touch /usr/bin/eclipse
	chmod 755 /usr/bin/eclipse

	cat <<-SCRIPT >> /usr/bin/eclipse
			#!/bin/sh
			export ECLIPSE_HOME="/opt/eclipse"
			
			\$ECLIPSE_HOME/eclipse \$*
		SCRIPT

	cat <<-SCRIPT >> /usr/share/applications/eclipse.desktop
			[Desktop Entry]
			Encoding=UTF-8
			Name=Eclipse
			Comment=Eclipse
			Exec=eclipse
			Icon=/opt/eclipse/icon.xpm
			Terminal=false
			Type=Application
			Categories=GNOME;Application;Development;
			StartupNotify=true
		SCRIPT

fi

rm -f /opt/$ECLIPSE_FILENAME