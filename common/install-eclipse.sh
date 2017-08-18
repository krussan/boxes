#/bin/sh
wget http://ftp.acc.umu.se/mirror/eclipse.org/technology/epp/downloads/release/oxygen/R/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz -P /opt -nv
tar xvf /opt/eclipse-jee-oxygen-R-linux-gtk-x86_64.tar.gz -C /opt

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

rm /opt/*.tar.gz