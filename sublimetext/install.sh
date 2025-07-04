#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

KEYRING=/usr/share/keyrings/sublime-text-archive-keyring.gpg
LIST_FILE=/etc/apt/sources.list.d/sublime-text.list

if ! command -v subl >/dev/null 2>&1; then
    echo "📥 Instalando Sublime Text..."

    # Baixa e instala a chave GPG no formato correto, se não existir
    if [ ! -f "$KEYRING" ]; then
        sudo curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o "$KEYRING"
    else
        echo "🔑 Chave GPG do Sublime Text já instalada."
    fi

    # Cria o arquivo de repositório com a opção signed-by, se não existir
    if [ ! -f "$LIST_FILE" ]; then
        echo "deb [signed-by=$KEYRING] https://download.sublimetext.com/ apt/stable/" | sudo tee "$LIST_FILE" > /dev/null
    else
        echo "📁 Repositório do Sublime Text já configurado."
    fi

    sudo apt-get update
    sudo apt-get install -y sublime-text
else
    echo "✅ Sublime Text já instalado."
fi
