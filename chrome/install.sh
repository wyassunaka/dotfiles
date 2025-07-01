#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed google-chrome; then
    echo "📥 Instalando Google Chrome..."
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt-get install -y ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
else
    echo "✅ Google Chrome já instalado."
fi
