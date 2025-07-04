#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

INSTALL_DIR="$HOME/.local/jetbrains-toolbox"
BIN_PATH="$INSTALL_DIR/bin/jetbrains-toolbox"
BIN_LINK="$HOME/.local/bin/jetbrains-toolbox"
DESKTOP_ENTRY="$HOME/.local/share/applications/jetbrains-toolbox.desktop"

if [ -x "$BIN_PATH" ]; then
    echo "✅ JetBrains Toolbox já instalado em $INSTALL_DIR"
    exit 0
fi

install_package jq rsync

echo "🌐 Buscando a versão mais recente do JetBrains Toolbox..."

DOWNLOAD_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" \
    | jq -r '.TBA[0].downloads.linux.link')

if [[ -z "$DOWNLOAD_URL" || "$DOWNLOAD_URL" == "null" ]]; then
    echo "❌ Não foi possível obter o link de download do JetBrains Toolbox."
    exit 1
fi

echo "📥 Baixando Toolbox de: $DOWNLOAD_URL"

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

wget -q "$DOWNLOAD_URL" -O toolbox.tar.gz
tar -xzf toolbox.tar.gz

TOOLBOX_FOLDER=$(find . -maxdepth 1 -type d -name "jetbrains-toolbox-*")

mkdir -p "$INSTALL_DIR"
rsync -a "$TOOLBOX_FOLDER"/ "$INSTALL_DIR"/

mkdir -p "$HOME/.local/bin"
ln -sf "$BIN_PATH" "$BIN_LINK"

mkdir -p "$(dirname "$DESKTOP_ENTRY")"
cat > "$DESKTOP_ENTRY" <<EOF
[Desktop Entry]
Name=JetBrains Toolbox
Exec=$BIN_LINK
Icon=$INSTALL_DIR/.install4j/jetbrains-toolbox.png
Type=Application
Categories=Development;
EOF

chmod +x "$DESKTOP_ENTRY"

echo "✅ JetBrains Toolbox instalado com sucesso!"
