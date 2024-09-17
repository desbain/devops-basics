!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install default-jdk -y
java --version

sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
sudo tar xzvf apache-maven-3.9.9-bin.tar.gz
sudo cp -r apache-maven-3.9.9 /opt
cd /opt
sudo apt install maven -y
mvn --version

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
