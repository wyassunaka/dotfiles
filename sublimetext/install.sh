#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed subl; then
    echo "📥 Instalando Sublime Text..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sublime.gpg
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install -y sublime-text
else
    echo "✅ Sublime Text já instalado."
fi
