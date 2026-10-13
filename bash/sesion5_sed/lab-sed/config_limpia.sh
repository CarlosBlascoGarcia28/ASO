#!/bin/bash

archivo=$1

if [ $# -eq 0 ]; then
    echo "Introduce un archivo de configuración"
    exit 1
fi

if [ -f $archivo ]; then
    sed -i '/^#/d; /^$/d' $archivo
    cat $archivo
else
    echo "Introduce un archivo de configuración válido"
    exit 1
fi