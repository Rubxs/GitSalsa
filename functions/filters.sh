# Autor: Rubén Herreros
# Función: 

function getFilter() {
    typeFilter=$1
    textFilter=$2    
    grep –v "#" /home/ruben/Escritorio/gitsalsa/databases/${typeFilter}.log | grep "${textFilter}"
}

function getAll() {
    typeFilter=$1
    grep –v "#" /home/ruben/Escritorio/gitsalsa/databases/${typeFilter}.log
}