#!/bin/bash

codigo=$1

clasificar(){
    if [[ $codigo -ge 200 && $codigo -le 599 ]]; then
        if [[ $codigo -ge 200 && $codigo -le 299 ]]; then
            echo "Éxito"
        elif [[ $codigo -ge 300 && $codigo -le 399 ]]; then
            echo "Redirección"
        elif [[ $codigo -ge 400 && $codigo -le 499 ]]; then
            echo "Error del cliente"
        else
            echo "Error del servidor"
        fi
    else
        echo "El código solo comprende valores entre 200 y 599"
    fi
}

clasificar