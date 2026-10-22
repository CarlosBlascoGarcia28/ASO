#!/bin/bash

destino=${1-/var/backups}
maximo=${2-7}

registrar() {
    local mensaje="$1"

    echo "$(date +%H:%M:%S) $mensaje"
    logger -t aso-backup "$mensaje"
}

if [[ ! -d "$destino" ]]; then
    registrar "Error: el directorio $destino no existe"
    exit 1
fi

if [[ ! $maximo =~ ^[0-9]+$ ]]; then
    registrar "Error: $maximo no es un número"
    exit 1
fi

if [[ $maximo -le 0 ]]; then
    registrar "Error: el número máximo de copias debe ser mayor que 0"
    exit 1
fi

fecha=$(date +%Y%m%d-%H%M%S)
copia="$destino/etc-$fecha.tar.gz"

if tar -czf "$copia" /etc 2>/dev/null; then
    registrar "Copia creada: $copia"
else
    registrar "Error: no se ha podido crear la copia $copia"
    exit 1
fi

total=0

for fichero in "$destino"/*; do
    if [[ -f "$fichero" ]]; then
        nombre=$(basename "$fichero")

        if [[ $nombre =~ $fecha ]]; then
            ((total++))
        fi
    fi
done

if [[ $total -gt $maximo ]]; then
    registrar "Aviso: hay $total copias y el máximo recomendado es $maximo"
fi