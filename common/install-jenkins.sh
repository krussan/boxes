PLUGINS="git xunit job-dsl subversion"
RESTART_REQ=0

if [ ! -d /var/lib/jenkins ]; then
	# Install the repository
	wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
	rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

	# Install jenkins
	yum install jenkins -y

	# Start the service and make it start on boot
	service jenkins start
	chkconfig jenkins on
	
	# wait for jenkins to start
	/vagrant_common/wait-for-jenkins.sh
fi

if [ ! -f /root/initialAdminPassword ]; then
	# Move the initial password to root directory
	mv /var/lib/jenkins/secrets/initialAdminPassword /root
	RESTART_REQ=1
fi

if [ ! -f /var/lib/jenkins/cli.jar ]; then
    /vagrant_common/wait-for-jenkins.sh
    
	# download the CLI jar from the web server. We'll use this later to install plugins
	wget -O /var/lib/jenkins/cli.jar http://localhost:8080/jnlpJars/jenkins-cli.jar
	chown jenkins:jenkins /var/lib/jenkins/cli.jar
fi

if [ ! -f /var/lib/jenkins/updates/default.json ]; then
    /vagrant_common/wait-for-jenkins.sh

	# Setup the update center
	wget http://updates.jenkins-ci.org/update-center.json -qO- | sed '1d;$d' > /var/lib/jenkins/updates/default.json
	chown jenkins:jenkins /var/lib/jenkins/updates/default.json
	chmod 644 /var/lib/jenkins/updates/default.json
fi

if [ ! -f /var/lib/jenkins/jenkins.install.InstallUtil.lastExecVersion ]; then
	# Supposedly this turns of the getting started wizard
	cp /var/lib/jenkins/jenkins.install.UpgradeWizard.state /var/lib/jenkins/jenkins.install.InstallUtil.lastExecVersion
	chown jenkins:jenkins /var/lib/jenkins/jenkins.install.InstallUtil.lastExecVersion
	RESTART_REQ=1
fi

# Restart
if [ "$RESTART_REQ" == "1" ]; then
	service jenkins restart
	/vagrant_common/wait-for-jenkins.sh
fi

ADMIN_PASS=`awk 1 ORS=' ' /root/initialAdminPassword`

echo "Installing plugins ..."
java -jar /var/lib/jenkins/cli.jar -s http://127.0.0.1:8080 install-plugin $PLUGINS --username admin --password $ADMIN_PASS

# Restart after plugin installation
service jenkins restart
/vagrant_common/wait-for-jenkins.sh

# output key
cat /root/initialAdminPassword