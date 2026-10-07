#!/bin/bash

mac=$1
re='[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}\:|-[a-fA-F0-9]{2}'

if [[ $# -eq 0 ]]; then
    echo "Introduce una MAC válida"
else
    if [[ $mac =~ $re ]]; then
        echo "la MAC: $mac es un formato correcto"
    else
        echo "la MAC: $mac no es un formato correcto"
    fi
fi