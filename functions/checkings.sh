#Autor: Juan Esteban Roig Perez
#Funcion: Comprobaciones

#chkQty $cantidad $limite $queLimitas
function chkQty(){
	if [[ $1 =~ [0-9]+ ]]; then
		if [[ $1 -gt $2 ]]; then
			echo "ERROR. No se pueden crear mas de $2 $3"
		else
			echo "true"
		fi
	else
		echo "formato incorrecto de los parametros"
	fi
}
