# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
<<<<<<< Updated upstream
. functions/filters.sh
. functions/log.sh

historic=$(zenity --list --title "Seleccione una opción" --column Acción "Histórico" "Errores")

if [[ "$historic" == "Histórico" ]]; then
	./components/historic-his.sh
elif [[ "$historic" == "Errores" ]]; then
	./components/historic-err.sh
fi
=======
. ../functions/filters.sh

echo `getHolaMundo HolaMundo`
>>>>>>> Stashed changes
