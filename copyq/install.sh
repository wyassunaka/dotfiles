#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if command -v copyq &>/dev/null; then
    echo "✅ CopyQ já está instalado."
    exit 0
fi

echo "📥 Instalando CopyQ via .deb..."

TMP_DEB="copyq.deb"
DOWNLOAD_URL="https://github.com/hluk/CopyQ/releases/download/v7.0.0/copyq_7.0.0_amd64.deb"

wget -q "$DOWNLOAD_URL" -O "$TMP_DEB"
sudo apt-get install -y "./$TMP_DEB"
rm "$TMP_DEB"
