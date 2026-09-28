#!/bin/bash

pedir_puerto_valido() {
    while true; do
        read -p "Introduce un puerto TCP (1-65535): " puerto
        if [[ ! $puerto =~ ^[0-9]+$ ]]; then
            echo "Error: debes introducir solo números."
            continue
        fi
        if (( puerto < 1 || puerto > 65535 )); then
            echo "Error: el puerto debe estar entre 1 y 65535."
            continue
        fi
        break
    done
}

pedir_puerto_valido

echo "Puerto válido recibido: $puerto"