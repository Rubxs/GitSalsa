# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

historic=$(zenity --list --title "Seleccione una opción" --column Acción "Histórico" "Errores")

if [[ "$historic" == "Histórico" ]]; then
    ./components/historic-typ.sh historic
elif [[ "$historic" == "Errores" ]]; then
    ./components/historic-typ.sh error
fi
