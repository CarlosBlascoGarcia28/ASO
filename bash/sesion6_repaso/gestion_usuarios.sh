#!/bin/bash

mostrar_error() {
    echo "Error: $1" >&2
    echo "Uso: $0 alta | baja identificador" >&2
    exit 1
}

generar_identificador() {
    local nombre="$1"
    local apellidos="$2"
    local parte_nombre
    local parte_apellido1
    local parte_apellido2

    parte_nombre=$(echo "$nombre" | cut -c1-2)
    parte_apellido1=$(echo "$apellidos" | cut -d' ' -f1 | cut -c1-2)
    parte_apellido2=$(echo "$apellidos" | cut -d' ' -f2 | cut -c1)

    echo "alu${parte_nombre}${parte_apellido1}${parte_apellido2}" |
        tr 'A-Z' 'a-z'
}

if [[ $# -eq 0 ]]; then
    mostrar_error "falta la acción"
fi

accion="$1"

case "$accion" in
    alta)
        read -r -p "Nombre: " nombre
        read -r -p "Apellidos: " apellidos

        if [[ ! $nombre =~ ^[a-zA-Z]+$ ]]; then
            mostrar_error "el nombre debe ser una sola palabra formada por letras"
        fi

        if [[ ! $apellidos =~ ^[a-zA-Z]+\ [a-zA-Z]+$ ]]; then
            mostrar_error "escribe los dos apellidos separados por un espacio"
        fi

        identificador=$(generar_identificador "$nombre" "$apellidos")

        if [[ ! $identificador =~ ^alu[a-z]{5}$ ]]; then
            mostrar_error "el nombre y el primer apellido deben tener al menos dos letras"
        fi

        echo "Identificador generado: $identificador"

        if id "$identificador" >/dev/null 2>&1; then
            mostrar_error "el usuario $identificador ya existe"
        fi

        echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$nombre $apellidos\" $identificador"
        ;;

    baja)
        if [[ -z $2 ]]; then
            mostrar_error "falta el identificador"
        fi

        identificador="$2"

        if [[ ! $identificador =~ ^alu[a-z]{5}$ ]]; then
            mostrar_error "$identificador no tiene el formato aluXXYYZ"
        fi

        if ! id "$identificador" >/dev/null 2>&1; then
            mostrar_error "el usuario $identificador no existe"
        fi

        echo "Para eliminarlo: sudo userdel $identificador"
        ;;

    *)
        mostrar_error "la acción $accion no es válida"
        ;;
esac