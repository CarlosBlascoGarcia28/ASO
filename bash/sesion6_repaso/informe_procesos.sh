#!/bin/bash

if [[ $# -gt 0 ]]; then
    n="$1"

    if [[ ! $n =~ ^[0-9]+$ ]]; then
        echo "Error: $n no es un número válido" >&2
        exit 1
    fi

    if [[ $n -le 0 ]]; then
        echo "Error: el número debe ser mayor que 0" >&2
        exit 1
    fi
fi

if ! ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt; then
    echo "Error: no se ha podido guardar el listado de procesos" >&2
    exit 1
fi

if [[ $# -gt 0 ]]; then
    head -n "$((n + 1))" procesos.txt
else
    cat procesos.txt
fi

lineas=$(wc -l < procesos.txt)
total=$((lineas - 1))

echo "----"
echo "Procesos de $USER: $total"