#!/bin/bash

altaobaja=$1
renom='^[a-zA-Z]+$'
reap=''

if [[ $altaobaja == 'Alta' ]]; then
    read -r "Introduce el nombre" nombre
    read -r "Introduce el primer apellidos" apellidos
