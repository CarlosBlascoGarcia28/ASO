#!/bin/bash
carpeta=$1
ext=$2

contar_por_extension(){
    resultado=$(find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l)
    for contar in $carpeta; do
        if [[ -d $carpeta ]]; then
            echo "$resultado"
        else
            echo "El parámetro tiene que ser una carpeta"
        fi
    done
}

contar_por_extension