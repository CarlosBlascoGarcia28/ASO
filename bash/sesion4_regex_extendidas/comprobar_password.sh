#!/bin/bash

contraseña=$1
re1='^.{12,}$'
re2='[0-9]'
re3='[[:upper:]]'
re4='[^[:alnum:]]'

if [ $# -eq 0 ]; then
    echo "Introduce una contraseña"
    exit 1
fi

if [[ $contraseña =~ $re1 ]]; then
    longitud="sí"
else
    longitud="no"
fi
echo "Tiene al menos 12 caracteres: $longitud"

if [[ $contraseña =~ $re2 ]]; then
    digito="sí"
else
    digito="no"
fi
echo "Contiene algún dígito: $digito"

if [[ $contraseña =~ $re3 ]]; then
    mayuscula="sí"
else
    mayuscula="no"
fi
echo "Contiene alguna mayúscula: $mayuscula"

if [[ $contraseña =~ $re4 ]]; then
    simbolo="sí"
else
    simbolo="no"
fi
echo "Contiene algún símbolo: $simbolo"

if grep -ixq "$contraseña" /usr/share/dict/spanish; then
    diccionario="no"
else
    diccionario="sí"
fi
echo "No es una palabra del diccionario: $diccionario"

if [[ "$longitud" = "sí" ]] && [[ "$digito" = "sí" ]] && [[ "$mayuscula" = "sí" ]] && [[ "$simbolo" = "sí" ]] && [[ "$diccionario" = "sí" ]]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi

#No creo que la contraseña Caminas2026! sea una contraseña segura a pesar de que cumple con las condicionese, ya que es una contraseña fácil de adivinar, recomendaría utilzar más símbolos y números además de  los ya existentes para hacerla más robusta.