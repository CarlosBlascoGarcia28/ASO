#!/bin/bash

for linea in ~/ASO/bash/sesion1_repaso/prueba_bash/*; do
    basename $linea
    if [[ -f $linea ]]; then
        echo "archivo"
    else
        echo "directorio"
    fi
done