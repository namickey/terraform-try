#!/bin/bash

echo hello2

echo 'su - ec2-user'
su - ec2-user

echo 'cd /home/ec2-user'
cd /home/ec2-user

echo 'pwd'
pwd

echo 'sudo yum -y install git'
sudo yum -y install git

echo 'git clone https://github.com/namickey/nuxt-try.git'
git clone https://github.com/namickey/nuxt-try.git

echo 'ls -la'
ls -la

echo 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo '. ~/.nvm/nvm.sh'
. ~/.nvm/nvm.sh

echo 'nvm install --lts'
nvm install --lts

cd /home/ec2-user/nuxt-try

npm install -y

npm run dev &
