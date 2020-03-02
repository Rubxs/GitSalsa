# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

historicErr=$(zenity --list --title "Seleccione una opción" --column Acción "Filtros" "Listado" "Gráfico")

if [[ "$historicErr" == "Filtros" ]]; then
	./components/historic-fil.sh $1 getFilter
elif [[ "$historicErr" == "Listado" ]]; then
	./components/historic-lis.sh $1
elif [[ "$historicErr" == "Gráfico" ]]; then
	./components/historic-fil.sh $1 getGraphic
fi