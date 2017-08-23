sudo -u vagrant mkdir /home/vagrant/git
sudo -u vagrant cd /home/vagrant/git
sudo -u vagrant git clone git@git.com:/krussan/jukebox
sudo -u vagrant git clone git@git.com:/krussan/protodb
sudo -u vagrant git clone git@git.com:/krussan/fiatlux
sudo -u vagrant git clone git@git.com:/krussan/maven-repo


echo export GIT_BASE=/home/vagrant/git >> /home/vagrant/.bashrc
