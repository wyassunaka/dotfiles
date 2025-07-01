#!/bin/bash
set -e
source "$(dirname "$0")/../utils.sh"

if ! is_installed teams; then
    echo "📥 Instalando Microsoft Teams..."

    wget -q https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.6.00.12455_amd64.deb -O teams.deb
    sudo apt-get install -y ./teams.deb
    rm teams.deb

else
    echo "✅ Microsoft Teams já instalado."
fi
