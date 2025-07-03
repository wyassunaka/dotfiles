#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

# Instala o Python 3 se necessário
if ! command -v python3 &>/dev/null; then
    echo "📥 Instalando Python 3..."
    install_package python3
else
    echo "✅ Python 3 já instalado."
fi

# Instala o pip3 se necessário
if ! command -v pip3 &>/dev/null; then
    echo "📥 Instalando pip3..."
    install_package python3-pip
else
    echo "✅ pip3 já instalado."
fi
