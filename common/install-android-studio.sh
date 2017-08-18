#!/bin/sh
wget https://dl.google.com/dl/android/studio/ide-zips/2.3.3.0/android-studio-ide-162.4069837-linux.zip -P /opt -nv
unzip /opt/android-studio-ide-162.4069837-linux.zip -d /opt


cat <<-SCRIPT > /usr/share/applications/studio.desktop
		[Desktop Entry]
		Encoding=UTF-8
		Name=Android Studio
		Comment=Android Studio
		Exec=/opt/android-studio/bin/studio.sh
		Icon=/opt/android-studio/bin/studio.png
		Terminal=false
		Type=Application
		Categories=GNOME;Application;Development;
		StartupNotify=true
	SCRIPT
