#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed code; then
    echo "📥 Instalando VSCode..."
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get update
    sudo apt-get install -y code
    rm packages.microsoft.gpg
else
    echo "✅ VSCode já instalado."
fi
