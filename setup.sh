#!/bin/bash

echo hello2

echo 'su ec2-user'
su ec2-user

echo 'whoami'
whoami

echo 'pwd'
pwd

echo 'cd /home/ec2-user'
cd /home/ec2-user

echo 'pwd'
pwd

echo 'sudo yum -y install git'
sudo yum -y install git

echo 'sudo -u ec2-user git clone https://github.com/namickey/nuxt-try.git'
sudo -u ec2-user git clone https://github.com/namickey/nuxt-try.git

echo 'ls -la'
ls -la

sudo -u ec2-user /bin/bash /home/ec2-user/nuxt-try/setup-ec2.sh

