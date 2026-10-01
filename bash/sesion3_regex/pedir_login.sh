#!/bin/bash

while true; do
    read -p "introduce tu login: " login
    if [[ $login =~ ^[a-z][a-z0-9]*$ ]]; then
        echo "Login válido"
        if grep -q ^$login: /etc/passwd ; then
            echo "Este usuario ya existe en el sistema"
        else
            echo "Para crear este usuario ejecuta el siguiente comando: useradd -m -s /bin/bash $login"
        fi
        break
    else
        echo "Login no válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
    fi
done