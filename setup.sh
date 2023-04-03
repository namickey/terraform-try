#!/bin/bash

echo hello

sudo -u ec2-user cd

sudo -u ec2-user curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

sudo -u ec2-user . ~/.nvm/nvm.sh

sudo -u ec2-user nvm install 16

sudo -u ec2-user yum install git

sudo -u ec2-user git clone https://github.com/namickey/nuxt-try.git



