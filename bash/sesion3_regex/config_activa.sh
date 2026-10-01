#!/bin/bash

if [[ $1 = "" ]]; then
    fichero="/etc/login.defs"
else
    fichero="$1"
fi

if [[ ! -f $fichero ]]; then
    echo "Error: El fichero $fichero no existe."
    break
fi
grep -v -e ^# -e "^$" $fichero

# PASS_MAX_DAYS Define la validez temporal de una contraseña del sistema antes de caducar. 