# Autor: Rubén Herreros
# Funciones para la creación y gestión de los archivos LOG del programa

function setLog() {
    type=$1
    id=$2
    user=$3
    action=$4
    repository=$5
    message=$6

    if [ $type == 'error' ]
        then
            echo $id':'$user':'$action':'$repository':'$message >> /home/ruben/Escritorio/gitsalsa/databases/error.log
        else
            echo $id':'$user':'$action':'$repository':'$message >> /home/ruben/Escritorio/gitsalsa/databases/historic.log
    fi

    # Revisar las rutas absolutas al crear la estructura del programa
}