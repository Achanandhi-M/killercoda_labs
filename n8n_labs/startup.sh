#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Installing curl..."
apt-get update -y >/dev/null 2>&1
apt-get install -y curl >/dev/null 2>&1

echo "[INFO] Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash >/dev/null 2>&1

# Load NVM into shell manually (VERY IMPORTANT)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

echo "[INFO] Installing Node 20..."
nvm install 20 >/dev/null 2>&1
nvm use 20 >/dev/null 2>&1

echo "[INFO] Node version: $(node -v)"
echo "[INFO] NPM version : $(npm -v)"

echo "[INFO] Installing n8n..."
npm install -g n8n --unsafe-perm=true --loglevel=warn >/dev/null 2>&1

echo "[INFO] Starting n8n with tunnel..."
nohup n8n start --tunnel > /root/n8n.log 2>&1 &

sleep 10

echo "[INFO] Checking if n8n is running..."
pgrep -af n8n || echo "❌ n8n failed to start. Check logs: cat /root/n8n.log"
