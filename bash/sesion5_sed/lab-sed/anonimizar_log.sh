#!/bin/bash

log=$1
 
if [ $# -eq 0 ]; then
    echo "Introduce un log"
    exit 1
fi

if [ -e $log ]; then
    sed -E -i.anonimo 's/([0-9]{1,3}\.){3}[0-9]{1,3}/X.X.X.X/g' $log
    echo "Fichero anonimizado: $log.anonimo"
    cat $log.anonimo
else    
    echo "Introduce un log que exista"
    exit 1
fi


