#!/bin/bash

pedir_puerto_valido(){
    read -p "Escriba un puerto: " puerto
    if [[ $puerto =~ ^[0-9]+$ ]]; then
        while [[ $puerto -lt 1 || $puerto -gt 65535 ]]; do
            echo "Ese puerto no existe"
            break
        done
            echo "$puerto"
    else
        echo "La cadena deben de ser dígitos"
    fi
}

pedir_puerto_valido

---------------------------------------------------------

pedir_puerto_valido(){
    read -p "Escriba un puerto: " puerto
    while [[ $puerto -lt 1 || $puerto -gt 65535 ]]; do
        if [[ $puerto =~ ^[0-9]+$ ]]; then
            until [[ $puerto -ge 1 && $puerto -le 65535 ]]; do
                echo "Ese puerto no existe"
                exit
            done
                echo "$puerto"
        else
            echo "La cadena deben de ser dígitos"
        fi
    done
}

pedir_puerto_valido