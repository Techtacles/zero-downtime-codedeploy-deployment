#!/bin/bash 
sudo apt update
sudo apt-get -y install ruby-full
sudo apt-get -y install wget
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
systemctl start codedeploy-agent

sudo apt install apache2
systemctl start apache2
