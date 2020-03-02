# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. functions/filters.sh
. functions/log.sh

getAll $1
read -p "Pulsa Enter para continuar..."
clear
./components/create-file.sh