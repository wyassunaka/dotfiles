#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

POSTMAN_DIR="/opt/Postman"
POSTMAN_BIN="$POSTMAN_DIR/app/Postman"
LINK_PATH="/usr/bin/postman"
DESKTOP_FILE="$HOME/.local/share/applications/postman.desktop"

if [ -d "$POSTMAN_DIR" ] && [ -x "$POSTMAN_BIN" ]; then
    echo "✅ Postman já instalado."
else
    echo "📥 Instalando Postman..."

    TMPFILE="postman.tar.gz"
    wget -q https://dl.pstmn.io/download/latest/linux64 -O "$TMPFILE"
    sudo tar -xzf "$TMPFILE" -C /opt
    rm "$TMPFILE"

    sudo chmod +x "$POSTMAN_BIN"
    sudo ln -sf "$POSTMAN_BIN" "$LINK_PATH"

    echo "✅ Postman instalado com sucesso!"
fi

# Cria arquivo .desktop para aparecer no menu de apps
mkdir -p "$(dirname "$DESKTOP_FILE")"
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Postman
Comment=Postman API Development Environment
Exec=$POSTMAN_BIN
Icon=$POSTMAN_DIR/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;Utility;
EOF

echo "✅ Arquivo .desktop criado para o Postman."
