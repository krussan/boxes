#!/bin/sh
STUDIO_FILENAME=android-studio-ide-171.4443003-linux.zip
if [ ! -d /opt/android-studio ]; then
	echo Running android studio installation ...

	if [ ! -f /opt/$STUDIO_FILENAME ]; then
		wget https://dl.google.com/dl/android/studio/ide-zips/3.0.1.0/$STUDIO_FILENAME -P /opt -nv
			 
	fi
	
	unzip /opt/$STUDIO_FILENAME -d /opt


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

	echo '\n' >> /opt/android-studio/bin/idea.properties
	echo disable.android.first.run=true >> /opt/android-studio/bin/idea.properties
	
fi

rm -f /opt/$STUDIO_FILENAME
