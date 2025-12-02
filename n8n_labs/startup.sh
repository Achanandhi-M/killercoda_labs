#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Updating apt..."
apt-get update -y >/dev/null 2>&1

echo "[INFO] Installing curl..."
apt-get install -y curl >/dev/null 2>&1

echo "[INFO] Installing NodeJS 20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash - >/dev/null 2>&1
apt-get install -y nodejs >/dev/null 2>&1

echo "[INFO] Node version: $(node -v)"
echo "[INFO] NPM version: $(npm -v)"

echo "[INFO] Installing n8n..."
npm install -g n8n --unsafe-perm=true --loglevel=warn >/dev/null 2>&1

echo "[INFO] Starting n8n with tunnel..."
nohup n8n start --tunnel > /root/n8n.log 2>&1 &

sleep 10

echo "[INFO] Checking if n8n is running..."
pgrep -af n8n || echo "❌ n8n failed to start. Check logs: cat /root/n8n.log"
