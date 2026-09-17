#!/bin/bash

bytesu=$1
bytest=$2
porcentaje=$((bytesu * 100 / bytest))

if [[ $# -eq 2 ]]; then
    if [[ $porcentaje -lt 70 ]]; then
        echo "OK"
    elif [[ $porcentaje -ge 70 && $porcentaje -lt 90 ]]; then
        echo "AVISO (cuidado con el límite exacto)"
    else
        echo "CRÍTICO"
    fi
else
    echo "Introduce dos parámetros válidos"
fi
