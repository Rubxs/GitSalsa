# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

typeList=$1
textZenity=`getAll ${typeList}`
zenity --info --text "${textZenity}"