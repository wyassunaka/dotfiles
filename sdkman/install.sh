#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if [ -d "$HOME/.sdkman" ]; then
    echo "✅ SDKMAN! já está instalado."
    exit 0
fi

echo "📥 Instalando SDKMAN!..."
curl -s "https://get.sdkman.io" | bash

# Detecta shell padrão
SHELL_NAME=$(basename "$SHELL")
RC_FILE=""

case "$SHELL_NAME" in
  bash) RC_FILE="$HOME/.bashrc" ;;
  zsh)  RC_FILE="$HOME/.zshrc" ;;
  *)
    echo "⚠️ Shell $SHELL_NAME não reconhecido. Configure o SDKMAN manualmente."
    exit 0
    ;;
esac

# Garante que o init do SDKMAN está no shell
if ! grep -q 'sdkman-init.sh' "$RC_FILE"; then
    echo "➕ Adicionando SDKMAN ao $RC_FILE"
    echo '' >> "$RC_FILE"
    echo '# SDKMAN' >> "$RC_FILE"
    echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> "$RC_FILE"
else
    echo "✅ SDKMAN já configurado no $RC_FILE"
fi

echo ""
echo "✅ SDKMAN instalado e configurado. Abra um novo terminal ou execute:"
echo "    source $RC_FILE"
