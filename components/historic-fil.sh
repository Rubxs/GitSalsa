# Autor: Rubén Herreros
# Función:

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

logType=$1
actionType=$2


filters=$(zenity --list --title "Seleccione una opción" --column Acción "Id" "Usuario" "Acción" "Mensaje")

if [[ "${actionType}" == "getFilter" ]]; then
    idAnswer=$(zenity --entry --text "Introduce ${filters}, uno o varios separados por espacio")
    typeFile=log
    ${actionType} ${logType} ${filters} ${idAnswer}
elif [[ "$actionType" == "getGraphic" ]]; then
    typeFile=data
    ${actionType} ${logType} ${filters}
fi

read -p "Pulsa Enter para continuar..."
clear
./components/create-file.sh ${typeFile}