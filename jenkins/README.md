# Provisioning script for jenkins on CentOS/7

This script sets up a jenkins server with the DSL plugin installed.

It sets up a DSL seed job with an url to a GIT repository where the DSL scripts are located.
It also sets up a user to authenticate the creation of the DSL jobs and runs the DSL plugin in groovy sandbox mode.

## Usage

To setup the provisioning you first need to run the setup script for setting up your path to the repository. 

After that you just vagrant up.
```
powershell -File setup.ps1 http://github.com/krussan/jenkins-dsl.git
vagrant up
```

The jenkins installation can be accessed at http://localhost:8080/