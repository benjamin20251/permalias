#!/bin/bash

FILE="$HOME/.permalias_aliases"

echo "Desinstalando permalias..."

# Borrar bloque permalias del bashrc
sed -i '/# permalias/,+20d' "$HOME/.bashrc"

# Borrar archivo de alias
rm -f "$FILE"

# Quitar de la sesión actual
unalias permalias 2>/dev/null

echo "✔ Desinstalado. Ejecutá: source ~/.bashrc"