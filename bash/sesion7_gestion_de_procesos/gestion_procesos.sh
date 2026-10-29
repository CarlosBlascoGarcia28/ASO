#!/bin/bash

validar_pid() {
    local pid=$1

    if [[ ! "$pid" =~ ^[0-9]+$ ]]; then
        return 1
    fi

    ps -p "$pid" > /dev/null 2>&1
}

listar_usuario() {
    local usuario=$1
    local salida=$(ps -u $usuario)
    if id $usuario >/dev/null; then
        echo "$salida"
    else
        echo "El usuario no existe"
    fi
}

buscar_proceso() {
    local proceso=$1
    local salida=$(ps -C $proceso -o user,pid,stat,%cpu,cmd)
        if [[ -z $salida ]]; then
            logger "No hay ningún proceso"
        fi
    echo "$salida"
}

top_cpu() {
    local n=${1:-5}
    local n=$((n + 1))
    local salida=$(ps aux --sort=-%cpu | head -n "$n")
    echo "$salida"
}

cambiar_prioridad() {
    local PID=$1
    local nuevo_valor=$2
    if ! validar_pid $PID; then
        echo "Error: PID no válido"
    fi
    if [[ $nuevo_valor -lt -20 || $nuevo_valor -lt 0 ]]; then
        echo "Error: el valor debe estar entre -20 y 19"
    fi
    if [[ $(id -u) -ne 0 && $nuevo_valor -lt 0 ]]; then
        echo "Error: necesitar ser root para usar valores negativos"
    fi
    local salida=$(renice -n $nuevo_valor -p $PID)
}

#finalizar_proceso() {

#}

while true; do
    echo "===== GESTIÓN DE PROCESOS ====="
    echo "1) Listar los procesos de un usuario"
    echo "2) Buscar un proceso por nombre"
    echo "3) Mostrar los N procesos que más CPU consumen"
    echo "4) Cambiar la prioridad de un proceso"
    echo "5) Finalizar un proceso"
    echo "6) Salir"
    read -p "introduce una opción: " opcion

    case $opcion in
        1)
        read -r -p "Introduce el nombre del usuario: " usuario
        resultado=$(listar_usuario $usuario)
        ;;
        2)
        read -r -p "Introduce el nombre del proceso: " proceso
        resultado=$(buscar_proceso $proceso)
        ;;
        3)
        read -r -p "Introduce el número de procesos que deseas visualizar: " procesos
        resultado=$(top_cpu $procesos)
        ;;
        4)
        read -r -p "Introduce el PID del proceso que deseas cambiar: " PID
        read -r -p "Introduce el valor que deseas asignarle: " valor
        resultado=$(cambiar_prioridad $valor $PID)
        ;;
        #5)resultado=$(finalizar_proceso);;
        6)
            echo "Saliendo..."
            exit 0
            ;;
    esac

    echo $resultado

done
