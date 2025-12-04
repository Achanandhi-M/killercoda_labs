#!/bin/bash

echo "⏳ Setting up the environment... please wait..."

# Update package list
apt-get update -y >/dev/null 2>&1

# Install Docker
echo "🐳 Installing Docker..."
apt-get install -y docker.io >/dev/null 2>&1

# Install Git
echo "Installing Git..."
apt-get install -y git >/dev/null 2>&1

# Start Docker
systemctl start docker
systemctl enable docker >/dev/null 2>&1

echo "Setup complete!"
echo ""
docker --version
git --version