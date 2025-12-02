#!/bin/bash

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v
npm install n8n -g
n8n
npm install -g pm2
pm2 start n8n
