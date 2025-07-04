#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if is_installed htop; then
    echo "✅ htop já está instalado."
else
    echo "📥 Instalando htop..."
    install_package htop
fi
