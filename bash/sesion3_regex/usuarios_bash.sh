#!/bin/bash

contador=0
while read -r linea; do
    echo "${linea%%:*}"
    if [[ ${linea%%:*} ]]; then
        contador=$((contador + 1))
    fi
done < /etc/passwd
echo "número de usuarios: $contador"