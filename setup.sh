#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "🔧 Atualizando cache do apt..."
sudo apt-get update -y

# Garantir permissão para os scripts
find . -type f -name "install.sh" -exec chmod +x {} \;

source "$DIR/utils.sh"

echo "🔧 Iniciando setup do ambiente..."

for tool in vscode chrome postman flameshot sublimetext docker docker-compose copyq dbeaver teams htop meld jetbrains-toolbox sdkman asdf python; do
    echo "▶ Instalando $tool..."
    "$DIR/$tool/install.sh"
done

echo "✅ Setup finalizado com sucesso!"
