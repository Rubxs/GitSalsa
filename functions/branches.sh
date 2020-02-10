#Autor: Juan Esteban Roig Perez
#Funcionalidad: Funciones para la gestión de ramas
. log.sh

#Crea una nueva rama
function newBranch(){
	params=$1
	while [[ $2 -eq '' ]]; do
		if [[ git rev-parse --verify $2 ]]; then
			git checkout -b ${params} $2
			if [[ git checkout -b ${params} $2 ]]; then
				echo 'Se ha producido un error durante la creación del repositorio ' $2
				#ejecutar codigo de log
			fi
		else 
			echo 'La rama' $2 'ya existe, por lo tanto se ha omitido'
			# ejecutar codigo de log
		fi 
		#ejecutar codigo de log
		shift
	done
}

#cambia la rama
function changeBranch(){
	name=$1
 	if [[ git rev-parse --verify $name ]]; then
		if [[ git checkout ${name} ]]; then
			echo 'Se ha producido un error durante la creación de la rama ' $name
			#ejecutar codigo de log
		else
			git checkout ${name}
		fi
	else
		echo 'La rama no existe'
	fi 
}

#borra la rama (nombre,remota)
function deleteBranch(){
	while [[ $1 -eq '' ]]; do
		if [[ git rev-parse --verify $1 ]]; then
			if [[ git branch -d $1 ]]; then
				git branch -d $1
				#ejecutar codigo de log
			else
				echo 'Se ha producido un error durante la creación del repositorio ' $2
				#ejecutar codigo de log
			fi
		else 
			echo 'La rama' $2 'no existe, por lo tanto se ha omitido'
			# ejecutar codigo de log
		fi 
		#ejecutar codigo de log
		shift
	done
}

#test