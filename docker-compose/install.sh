#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

DC_VERSION="1.27.4"
DC_PATH="/usr/local/bin/docker-compose"

if [ -x "$DC_PATH" ]; then
    INSTALLED_VERSION=$($DC_PATH version --short || echo "")
    if [ "$INSTALLED_VERSION" == "$DC_VERSION" ]; then
        echo "✅ Docker Compose $DC_VERSION já instalado."
        exit 0
    else
        echo "⚠️ Versão diferente detectada. Atualizando para $DC_VERSION..."
        sudo rm -f "$DC_PATH"
    fi
fi

echo "📥 Instalando Docker Compose $DC_VERSION..."
sudo curl -L "https://github.com/docker/compose/releases/download/$DC_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o "$DC_PATH"
sudo chmod +x "$DC_PATH"
