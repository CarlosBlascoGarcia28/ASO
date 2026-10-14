#!/bin/bash

archivo="passwd"
usuario=$1
shell=$2

if [[ $# -ne 2 ]]; then
    echo "Introduce un usuario válido"
    exit 1
fi

if [[ ! -f $archivo ]]; then
    echo "Error: no existe $archivo"
    exit 1
fi

if ! [[ $shell =~ ^(/bin/bash|/bin/sh|/bin/zsh)$ ]]; then
    echo "Error: la shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1
fi

if ! grep -q "^${usuario}:" "$archivo"; then
    echo "Error: el usuario $usuario no existe"
    exit 1
fi

sed -i.bak "s|^\(${usuario}:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:\).*|\1${shell}|" "$archivo"
grep "^${usuario}:" "$archivo"