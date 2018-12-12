#!/bin/sh
JIRA_VERSION=7.12.3
JIRA_BASEURL=https://product-downloads.atlassian.com/software/jira/downloads
JIRA_FILENAME=atlassian-jira-software-$JIRA_VERSION.tar.gz
JIRA_URL=$JIRA_BASEURL/$JIRA_FILENAME

download()
{
    local url=$1
    echo -n "    "
    wget -P /opt --progress=dot $url 2>&1 | grep --line-buffered "%" | \
        sed -u -e "s,\.,,g" | awk '{printf("\b\b\b\b%4s", $2)}'
    echo -ne "\b\b\b\b"
    echo " DONE"
}

if [ ! -d /opt/jira ]; then
    echo Running JIRA installation ...
	
	if [ ! -f /opt/$JIRA_URL ]; then 
		echo Downloading binary ...
		download $JIRA_URL 
	fi

	sudo -u postgres psql -c "CREATE ROLE jiradbuser WITH LOGIN PASSWORD 'jiradbuser' "
	sudo -u postgres createdb -E UNICODE -l C -T template0 jiradb
	sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE jiradb to jiradbuser "
	
	
	
	# create android group and add vagrant user to that group
	# useradd android -U
	# usermod -a -G android vagrant

	# # Make android group owner of the SDK folder
	# chown -R android:android /opt/android-sdk-linux
	# find /opt/android-sdk-linux -type d -exec chmod 775 {} +

	# # Make a symbolic link to android executable
	# ln -s /opt/android-sdk-linux/tools/android /usr/bin/android 

	# #find . -type d -print -exec chmod 775 {} \;
	# #find . -type f -perm 740 -print -exec chmod 755 {} \;
	# #find . -type f -perm 640 -print -exec chmod 644 {} \;

	# #install packages
	# sudo -u android /vagrant_common/update-android-sdk.sh

	# # Make a symbolic link to adb executable
	# ln -s /opt/android-sdk-linux/platform-tools/adb /usr/bin/adb
	# ln -s /opt/android-sdk-linux/tools/bin/sdkmanager /usr/bin/sdkmanager

	# # Create environment variables
	# echo export ANDROID_HOME=/opt/android-sdk-linux >> /home/vagrant/.bashrc
	# echo PATH=\$PATH:\$ANDROID_HOME/tools:\$ANDROID_HOME/platform-tools >> /home/vagrant/.bashrc
	# echo export PATH >> /home/vagrant/.bashrc
fi

#rm -f /opt/$SDK_FILENAME
