#!/bin/bash

FILE="$HOME/.permalias_aliases"

echo "Instalando permalias..."

# Crear archivo de alias si no existe
[ ! -f "$FILE" ] && touch "$FILE"

# Agregar función permalias al bashrc si no existe
if ! grep -q "# permalias" "$HOME/.bashrc"; then
cat >> "$HOME/.bashrc" << 'EOF'

# permalias
permalias() {
    FILE="$HOME/.permalias_aliases"
    [ ! -f "$FILE" ] && touch "$FILE"

    INPUT="$1"

    # Validar formato
    if [[ "$INPUT" != *=* ]]; then
        echo "Uso: permalias nombre=\"comando\""
        return
    fi

    NAME=$(echo "$INPUT" | cut -d '=' -f1)
    VALUE=$(echo "$INPUT" | cut -d '=' -f2-)

    if [ -z "$VALUE" ]; then
        echo "Error: comando vacío"
        return
    fi

    # Eliminar alias previo
    sed -i "/alias $NAME=/d" "$FILE"

    # Guardar alias
    echo "alias $NAME=$VALUE" >> "$FILE"

    # Aplicar en la sesión actual
    alias "$NAME=$VALUE"
}

# Cargar aliases al iniciar
[ -f ~/.permalias_aliases ] && source ~/.permalias_aliases

EOF
fi

echo "✔ Instalado. Ejecutá: source ~/.bashrc"