#!/bin/bash

cd /home/ec2-user

# git install
sudo yum -y install git

# clone
sudo -u ec2-user git clone https://github.com/namickey/nuxt-try.git

# exec setup-ec2
sudo -u ec2-user /bin/bash /home/ec2-user/nuxt-try/setup-ec2.sh

