#!/bin/bash

function is_installed() {
    command -v "$1" &> /dev/null
}

function install_package() {
    local pkg="$1"
    if dpkg -s "$pkg" &>/dev/null; then
        echo "📦 $pkg já está instalado."
    else
        echo "📥 Instalando $pkg..."
        sudo apt-get install -y "$pkg"
    fi
}
