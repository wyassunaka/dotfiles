#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

ASDF_DIR="$HOME/.asdf"

if [ -d "$ASDF_DIR" ]; then
    echo "✅ asdf já está instalado."
else
    echo "📥 Instalando asdf..."

    git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.14.0

    # Detecta shell padrão
    SHELL_NAME=$(basename "$SHELL")
    RC_FILE=""

    case "$SHELL_NAME" in
      bash) RC_FILE="$HOME/.bashrc" ;;
      zsh)  RC_FILE="$HOME/.zshrc" ;;
      *)
        echo "⚠️ Shell $SHELL_NAME não reconhecido. Configure o asdf manualmente."
        exit 0
        ;;
    esac

    if ! grep -q 'asdf.sh' "$RC_FILE"; then
        echo "➕ Configurando asdf no $RC_FILE"
        echo '' >> "$RC_FILE"
        echo '# asdf' >> "$RC_FILE"
        echo '. "$HOME/.asdf/asdf.sh"' >> "$RC_FILE"
        echo '. "$HOME/.asdf/completions/asdf.bash"' >> "$RC_FILE"
    else
        echo "✅ asdf já configurado no $RC_FILE"
    fi

    # Carrega asdf no ambiente atual
    source "$ASDF_DIR/asdf.sh"
fi
