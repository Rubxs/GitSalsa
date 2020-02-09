#Autor: Juan Esteban Roig Perez
#Funcionalidad: Funciones para la gestión de repositorios
. log.sh


function openRepository(){
	reponame=$(basename "$1")
	if [[ -d "${1}/.git" ]]; then
		echo $reponame
	else
		echo "No repo"
	fi
}

function createRepository(){
	reponame=$1
	repodir=$2
	if [[ -d "$repodir" ]]; then
		actual=$(pwd)
		mkdir "${repodir}/${reponame}"
		cd "${repodir}/${reponame}"
		git init
		cd $actual
		echo "Correcto"
	else
		echo "No existe"
	fi
}