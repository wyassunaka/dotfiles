#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if command -v postman >/dev/null 2>&1; then
    echo "✅ Postman já instalado."
else
    echo "📥 Instalando Postman..."
    wget -q https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    sudo ln -sf /opt/Postman/Postman /usr/bin/postman
    rm postman.tar.gz
fi
