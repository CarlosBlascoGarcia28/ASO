#!/bin/bash

listar_usuario() {
    local usuario=$1
    local salida=$(ps -u $usuario)
    echo "$salida"
}

buscar_proceso() {
    local proceso=$1
    local salida=$(ps -C $proceso)
    echo "$salida"
}

#top_cpu() {
    local usuario=$1
    local salida=$(ps -u $usuario -o pid,stat,%cpu,cmd --sort %cpu)
    echo "$salida"
#}

#cambiar_prioridad() {

#}

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
        read -p "Introduce el nombre del usuario: " usuario
        resultado=$(listar_usuario $usuario)
        ;;
        2)
        read -p "Introduce el nombre del proceso: " proceso
        resultado=$(buscar_proceso $proceso)
        ;;
        #3)
        #read -p "Introduce el nombre del usuario: " usuario
        #resultado=$(top_cpu);;
        #4)resultado=$(cambiar_prioridad);;
        #5)resultado=$(finalizar_proceso);;
        6)
            echo "Saliendo..."
            exit 0
            ;;
    esac

    echo $resultado

done
