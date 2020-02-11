# Autor: Rubén Herreros
# Funciones para recoger la información de los logs. 

function getFilter() {
    typeFilter=$1
    actionFilter=$2
    textFilter=$3
    grep "${textFilter}" databases/${typeFilter}.log | grep –v "#"
}

function getAll() {
    typeFilter=$1
    cat databases/${typeFilter}.log | grep –v "#"
}
