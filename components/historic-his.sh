# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

historicHis=$(zenity --list --title "Seleccione una opción" --column Acción "Filtros" "Listado")

if [[ "$historicHis" == "Filtros" ]]; then
	./components/historic-fil.sh historic
elif [[ "$historicHis" == "Listado" ]]; then
	./components/historic-lis.sh historic
fi