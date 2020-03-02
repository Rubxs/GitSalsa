# Autor: Rubén Herreros
# Funciones para la creación y gestión de los archivos LOG del programa.

function setLog() {
    type=$1
    id=$(setId ${type})
    user=$2
    action=$3
    repository=$4
    message=$5

    echo ${id}:${user}:${action}:${repository}:${message} >> ./databases/${type}.log
}

function setId() {
    fileType=$1
    lastId=$(grep -v '#' ./databases/${fileType}.log | tail -n1 | cut -d: -f1)
    if [[ ${last} =~ '^[0-9]+$' ]]; then
        let newId=0
    else
        let newId=${lastId}+1
    fi
    let charNums=$(echo ${newId} | wc -m)
    while [[ ${charNums} -le 5 ]];do
        newId="0${newId}"
        let charNums=${charNums}+1
    done
    echo ${newId}
}