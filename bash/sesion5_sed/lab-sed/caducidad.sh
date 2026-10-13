#!/bin/bash

dias=$1
cifras='[0-9]{1,3}'

if [ $# -eq 0 ]; then
    echo "Introduce un archivo de configuración"
    exit 1
fi

if [[ $dias =~ $cifras ]]; then
    sed -i.bak 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $dias/' login.defs
    antes=$(grep '^PASS_MAX_DAYS' login.defs.bak | head -n 1)
    despues=$(grep '^PASS_MAX_DAYS' login.defs | head -n 1)
    echo "Antes: $antes"
    echo "Después: $despues"
else
    echo "Error: $dias no es un número de días válido"
fi
