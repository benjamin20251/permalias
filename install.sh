#!/bin/bash

echo "Instalando permalias..."

FILE="$HOME/.permalias_aliases"

# crear archivo de alias si no existe
[ ! -f "$FILE" ] && touch "$FILE"

# agregar función si no existe
if ! grep -q "# permalias" "$HOME/.bashrc"; then
cat >> "$HOME/.bashrc" << 'EOF'

# permalias
permalias() {
    FILE="$HOME/.permalias_aliases"

    [ ! -f "$FILE" ] && touch "$FILE"

    INPUT="$1"
    NAME=$(echo "$INPUT" | cut -d '=' -f1)
    VALUE=$(echo "$INPUT" | cut -d '=' -f2-)

    # eliminar alias previo si existe
    sed -i "/alias $NAME=/d" "$FILE"

    # guardar alias
    echo "alias $NAME=$VALUE" >> "$FILE"

    # aplicar en la shell actual
    alias "$NAME=$VALUE"
}

# cargar alias al iniciar
[ -f ~/.permalias_aliases ] && source ~/.permalias_aliases

EOF
fi

echo "✔ Instalado. Ejecutá: source ~/.bashrc"