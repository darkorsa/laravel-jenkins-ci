#!/bin/bash

# Analytic tools install from composer
 
composer global require "phpunit/phpunit=4.1.*"
composer global require 'phploc/phploc=*'
composer global require 'phpmd/phpmd=*'
composer global require 'squizlabs/php_codesniffer=*'
composer global require 'sebastian/phpcpd=*'
composer global require 'sebastian/phpdcd=*'
composer global require 'theseer/phpdox=*'
composer global require 'pdepend/pdepend=*'
 
# Update 
sudo apt-get update
 
# Install php5-xsl
sudo apt-get install php5-xsl
 
#Install Java
sudo apt-get install openjdk-7-jdk
 
# Install Jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
 
# Restart Jenkins
sudo /etc/init.d/jenkins restart
 
#Install plugins using Jenkins CLI
wget http://localhost:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations warnings xunit
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart

# Getting deafault php template
sudo su jenkins
cd ~
cd jobs
mkdir php-template
cd php-template
wget https://raw.github.com/sebastianbergmann/php-jenkins-template/master/config.xml
