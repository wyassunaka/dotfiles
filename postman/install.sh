#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

POSTMAN_DIR="/opt/Postman"
if [ ! -d "$POSTMAN_DIR" ]; then
    echo "📥 Instalando Postman..."
    wget -q https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    sudo ln -sf /opt/Postman/Postman /usr/bin/postman
    rm postman.tar.gz
else
    echo "✅ Postman já instalado."
fi
