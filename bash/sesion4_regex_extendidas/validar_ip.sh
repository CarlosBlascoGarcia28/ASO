#!/bin/bash

ip=$1
re='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'

if [[ $# -eq 0 ]]; then
    echo "Introduce una IP válida"
else
    if [[ $ip =~ $re ]]; then
        echo "la IP: $ip es un formato correcto"
    else
        echo "la IP: $ip no es un formato correcto"
    fi
fi

#Pone que es válida, aunque no lo sea, para eso tendríamos que configurar otra restricción.