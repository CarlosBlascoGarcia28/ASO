correo=$1
re='^[a-z0-9._]+@(edu\.gva\.es|alu\.edu\.gva\.es)$'

if [[ $# -eq 0 ]]; then
    echo "Introduce un correo"
else
    if [[ $correo =~ $re ]]; then
        if [[ $correo =~ .*alu.* ]]; then
            echo "el correo $correo es un correo de alumno"
        else
            echo "el correo $correo es un correo de profesorado"
        fi
    else
        echo "introduce un correo válido"
    fi
fi