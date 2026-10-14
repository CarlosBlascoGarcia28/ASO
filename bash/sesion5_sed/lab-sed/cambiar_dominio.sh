#!/bin/bash

archivo=$1

if [[ $# -eq 0 ]]; then
    echo "Introduce un archivo de configuración"
    exit 1
fi

if [ -f $archivo ]; then
    sed -i 's/gmail.com/alu.edu.gva.es/g; s/hotmail.com/alu.edu.gva.es/g' $archivo
    cat $archivo
else
    echo "Introduce un archivo de configuración válido"
    exit 1
fi
