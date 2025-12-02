#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Updating system..."
apt-get update -y >/dev/null 2>&1

echo "[INFO] Installing NodeSource Node 20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>&1
apt-get install -y nodejs >/dev/null 2>&1

echo "[INFO] Node version: $(node -v)"
echo "[INFO] NPM version: $(npm -v)"

echo "[INFO] Installing PM2 process manager..."
npm install -g pm2 --silent >/dev/null 2>&1

echo "[INFO] Installing n8n..."
npm install -g n8n --unsafe-perm=true --silent >/dev/null 2>&1

echo "[INFO] Starting n8n with PM2..."
pm2 start n8n --name n8n -- start --tunnel >/root/n8n.log 2>&1

echo "[INFO] Saving PM2 state..."
pm2 save >/dev/null 2>&1

echo "[INFO] Checking if n8n is running..."
pm2 list

echo "[INFO] n8n logs available at: cat /root/n8n.log"
