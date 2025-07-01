#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed dbeaver-ce; then
    echo "📥 Instalando DBeaver CE..."

    wget -q https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O dbeaver-ce.deb
    sudo apt-get install -y ./dbeaver-ce.deb
    rm dbeaver-ce.deb

else
    echo "✅ DBeaver CE já está instalado."
fi
