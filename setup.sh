#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

# Garante que todos os scripts de instalação tenham permissão de execução
find . -type f -name "install.sh" -exec chmod +x {} \;

source "$DIR/utils.sh"

echo "🔧 Iniciando setup do ambiente..."

# for tool in vscode chrome postman flameshot sublimetext docker docker-compose copyq dbeaver teams htop; do
for tool in copyq; do
    echo "▶ Instalando $tool..."
    "$DIR/$tool/install.sh"
done

echo "✅ Setup finalizado com sucesso!"
