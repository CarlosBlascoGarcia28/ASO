#!/bin/bash

puerto=$1

if [[ "$#" -eq 0 ]]; then
    echo "No has introducido el parámetro requerido"
else
    if [[ $puerto =~ ^[0-9]+$ ]]; then
        if [[ $puerto -lt 1  ]] || [[ $puerto -gt 65535 ]]; then
            echo "$puerto está fuero del rango"
        else
            echo "$puerto es válido"
        fi
    else
        echo "Eso no es un número"
    fi
fi
