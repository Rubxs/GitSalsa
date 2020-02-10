# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

historicErr=$(zenity --list --title "Seleccione una opción" --column Acción "Filtros" "Listado")

if [[ "$historicErr" == "Filtros" ]]; then
	./components/historic-fil.sh error
elif [[ "$historicErr" == "Listado" ]]; then
	./components/historic-lis.sh error
fi