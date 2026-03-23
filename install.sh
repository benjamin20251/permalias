#!/bin/bash

echo "Instalando permalias..."

# copiar script o instrucciones
mkdir -p "$HOME/.permalias"

# agregar a bashrc si no existe
if ! grep -q "permalias" "$HOME/.bashrc"; then
    echo "" >> "$HOME/.bashrc"
    echo "# permalias" >> "$HOME/.bashrc"
    echo "[ -f ~/.permalias_aliases ] && source ~/.permalias_aliases" >> "$HOME/.bashrc"
fi
source ~/.bashrc
echo "✔ Instalado. Reiniciá la terminal o ejecutá: source ~/.bashrc"