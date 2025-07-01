#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed docker; then
    echo "📥 Instalando Docker..."
    sudo apt-get remove -y docker docker-engine docker.io containerd runc || true
    install_package ca-certificates
    install_package curl
    install_package gnupg
    install_package lsb-release

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
else
    echo "✅ Docker já instalado."
fi
