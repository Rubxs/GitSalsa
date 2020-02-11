# Autor: Rubén Herreros
# Función:

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

logType=$1
filters=$(zenity --list --title "Seleccione una opción" --column Acción "Id" "Usuario" "Acción" "Mensaje")
echo $filters
if [[ "$filters" == "Id" ]]; then
	idAnswer=$(zenity --entry --text "Introduce Id")
	log=`getFilter $logType id $idAnswer`
	#zenity --info --text "${log}"
	echo "${log}"
elif [[ "$filters" == "Usuario" ]]; then
	userAnswer=$(zenity --entry --text "Introduce Usuario")
	log=`getFilter ${logType} user $szAnswer`
	zenity --info --text "${log}"
elif [[ "$filters" == "Acción" ]]; then
	actionAnswer=$(zenity --entry --text "Introduce Acción")
	log=`getFilter ${logType} action $szAnswer`
	zenity --info --text "${log}"
elif [[ "$filters" == "Mensaje" ]]; then
	messageAnswer=$(zenity --entry --text "Introduce Mensaje")
	log=`getFilter ${logType} message $szAnswer`
	zenity --info --text "${log}"
fi