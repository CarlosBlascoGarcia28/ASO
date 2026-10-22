#!/bin/bash

shell_buscada=${1-/bin/bash}

if [[ ! $shell_buscada =~ ^(/[a-z]+)+*$ ]]; then
    echo "Error: $shell_buscada no es una ruta válida"
    exit 1
fi

total=0
uid_mayor_igual_1000=0

while IFS=':' read -r usuario x uid gid desc home shell; do
    if [[ $shell == "$shell_buscada" ]]; then
        echo "$usuario:$uid:$home:$shell"

        ((total++))

        if [[ $uid -ge 1000 ]]; then
            ((uid_mayor_igual_1000++))
        fi
    fi
done < /etc/passwd

echo "----"
echo "Cuentas listadas: $total"
echo "Con UID >= 1000: $uid_mayor_igual_1000"