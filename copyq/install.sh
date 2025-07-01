#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed copyq; then
    echo "📥 Instalando CopyQ..."
    sudo add-apt-repository -y ppa:hluk/copyq
    sudo apt-get update
    sudo apt-get install -y copyq
else
    echo "✅ CopyQ já instalado."
fi
