#!/bin/bash

for linea in ~/ASO/bash/sesion1_repaso/prueba_bash/*; do
    nombre=$(basename "$linea")
    if [[ -d $linea ]]; then
        echo "$nombre: directorio"
    elif [[ -f $linea ]]; then
        echo "$nombre: archivo"
    else
        echo "la entrada no es válida"
    fi
done