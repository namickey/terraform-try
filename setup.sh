#!/bin/bash

echo hello2

su - ec2-user

sudo yum -y install git

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

. ~/.nvm/nvm.sh

nvm install 16

git clone https://github.com/namickey/nuxt-try.git

cd nuxt-try

npm install -y

npm run dev &
