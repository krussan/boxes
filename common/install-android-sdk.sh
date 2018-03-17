#!/bin/sh
SDK_FILENAME=sdk-tools-linux-3859397.zip
if [ ! -d /opt/android-sdk-linux ]; then
    echo Running android SDK installation ...
	
	if [ ! -f /opt/$SDK_FILENAME ]; then 
		wget https://dl.google.com/android/repository/$SDK_FILENAME -P /opt -nv 
	fi

	unzip /opt/$SDK_FILENAME -d /opt/android-sdk-linux

	# create android group and add vagrant user to that group
	useradd android -U
	usermod -a -G android vagrant

	# Make android group owner of the SDK folder
	chown -R android:android /opt/android-sdk-linux

	# Make a symbolic link to android executable
	ln -s /opt/android-sdk-linux/tools/android /usr/bin/android 

	#find . -type d -print -exec chmod 775 {} \;
	#find . -type f -perm 740 -print -exec chmod 755 {} \;
	#find . -type f -perm 640 -print -exec chmod 644 {} \;

	#install packages
	sudo -u android /vagrant_common/update-android-sdk.sh

	# Make a symbolic link to adb executable
	ln -s /opt/android-sdk-linux/platform-tools/adb /usr/bin/adb
	ln -s /opt/android-sdk-linux/tools/bin/sdkmanager /usr/bin/sdkmanager

	# Create environment variables
	echo export ANDROID_HOME=/opt/android-sdk-linux >> /home/vagrant/.bashrc
	echo PATH=\$PATH:\$ANDROID_HOME/tools:\$ANDROID_HOME/platform-tools >> /home/vagrant/.bashrc
	echo export PATH >> /home/vagrant/.bashrc
fi

rm -f /opt/$SDK_FILENAME