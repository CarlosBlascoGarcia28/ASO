#!/bin/bash

if [[ -z $1 ]]; then
    fichero="/etc/login.defs"
else
    fichero="$1"
fi

if [[ ! -f $fichero ]]; then
    echo "Error: El fichero $fichero no existe."
    break
fi
grep -v -e ^# -e "^$" $fichero
total=$(wc -l < "$fichero")
utiles=$(grep -Ec '^[[:space:]]*[^#[:space:]]' "$fichero")
echo "Total de líneas: $total"
echo "Líneas útiles: $utiles"
# PASS_MAX_DAYS Define la validez temporal de una contraseña del sistema antes de caducar. 