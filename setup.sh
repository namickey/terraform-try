#!/bin/bash

echo hello

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

. ~/.nvm/nvm.sh

nvm install 16

yum install git

git clone https://github.com/namickey/nuxt-try.git



