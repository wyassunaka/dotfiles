#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

INSTALL_DIR="$HOME/.local/share/JetBrains/Toolbox"
TOOLBOX_BIN="$INSTALL_DIR/toolbox"

if [ -f "$TOOLBOX_BIN" ]; then
    echo "✅ JetBrains Toolbox já instalado."
    exit 0
fi

echo "🌐 Buscando a versão mais recente do JetBrains Toolbox..."

DOWNLOAD_URL=$(curl -s https://data.services.jetbrains.com/products/releases?code=TBA\&latest=true\&type=release \
  | grep -oP 'https://download.jetbrains.com/toolbox/jetbrains-toolbox-[^"]+linux\.tar\.gz' \
  | head -n 1)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "❌ Não foi possível obter o link de download do JetBrains Toolbox."
    exit 1
fi

echo "📥 Baixando: $DOWNLOAD_URL"

TMP_DIR=$(mktemp -d)
ARCHIVE="$TMP_DIR/toolbox.tar.gz"

wget -qO "$ARCHIVE" "$DOWNLOAD_URL"
tar -xzf "$ARCHIVE" -C "$TMP_DIR"

EXTRACTED_DIR=$(find "$TMP_DIR" -maxdepth 1 -type d -name "jetbrains-toolbox-*")

mkdir -p "$INSTALL_DIR"
mv "$EXTRACTED_DIR"/* "$INSTALL_DIR"

if ! command -v toolbox &> /dev/null; then
    sudo ln -s "$INSTALL_DIR/toolbox" /usr/local/bin/toolbox
fi

rm -rf "$TMP_DIR"

echo "✅ JetBrains Toolbox instalado com sucesso!"
