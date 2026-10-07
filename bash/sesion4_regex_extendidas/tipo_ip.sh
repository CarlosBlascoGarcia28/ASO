#!/bin/bash

ip=$1
loop='^127\.'
privada='^(10\.|172\.(1[6-9]|2[0-9]|3[01])\.|192\.168\.)'

if [ $# -eq 0 ]; then
    echo "Introduce una dirección IP"
    exit 1
fi

if [[ $ip =~ $loop ]]; then
    echo "Loopback"
    exit 0
fi

if [[ $ip =~ $privada ]]; then
    echo "Privada"
    exit 0
else
    echo "Pública"
    exit 0
fi