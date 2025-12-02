#!/bin/bash

apt-get update -y
apt-get install -y nodejs npm

npm install -g n8n

# Start n8n with tunnel so UI is accessible
nohup n8n start --tunnel > /var/log/n8n.log 2>&1 &
