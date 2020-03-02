#Autor: Juan Esteban Roig Perez
#Funcionalidad: Funciones para la gestión de repositorios


function openRepository(){
	reponame=$(basename "$1")
	if [[ -d "${1}/.git" ]]; then
		echo $reponame
	else
		echo "No repo"
	fi
}

function createRepository(){
	reponame=$(echo "$1" | tr " " "_")
	repodir=$2
	if [[ -d "$repodir" ]]; then
		actual=$(pwd)
		mkdir "${repodir}/${reponame}"
		cd "${repodir}/${reponame}"
		git init > nul
		cd $actual
		echo "Correcto"
	else
		echo "No existe"
	fi
}