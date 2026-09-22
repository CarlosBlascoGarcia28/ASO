#!/bin/bash

sumar() {
    echo $(($1 + $2))
}

restar() {
    echo $(($1 - $2))
}

multiplicar() {
    echo $(($1 * $2))
}

dividir() {
    if [[ $2 -eq 0 ]]; then
        echo "Error: división por cero"
    else
        echo "scale=2; $1 / $2" | bc
    fi
}
#El scale sirve para saber la cantidad de decimales, seguido de una tubería a bc para poder operar con ellos#

mostrar_menu() {
    echo "===== CALCULADORA ====="
    echo "1) Sumar"
    echo "2) Restar"
    echo "3) Multiplicar"
    echo "4) Dividir"
    echo "5) Salir"
}

while true; do
    mostrar_menu

    read -p "Elige una opción: " opcion

    if [[ $opcion -eq 5 ]]; then
        echo "Saliendo de la calculadora..."
        exit
    fi

    read -p "Introduce el primer número: " num1
    read -p "Introduce el segundo número: " num2

    case $opcion in
        1) resultado=$(sumar "$num1" "$num2") ;;
        2) resultado=$(restar "$num1" "$num2") ;;
        3) resultado=$(multiplicar "$num1" "$num2") ;;
        4) resultado=$(dividir "$num1" "$num2") ;;
        *) resultado="Opción no válida" ;;
    esac

    echo "Resultado: $resultado"
done