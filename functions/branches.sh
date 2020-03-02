#Autor: Juan Esteban Roig Perez
#Funcionalidad: Funciones para la gestión de ramas

. functions/log.sh
function newBranch(){
	if [[ `git branch --list $1` ]]; then
		echo "false"
	else
		directory=$(cut -f 1 -d ':' databases/repo.tmp)
		repository=$(cut -f 2 -d ':' databases/repo.tmp)
		dirAnterior=$(pwd)
		cd $repoDir
		git checkout -b $1
		cd $dirAnterior
		echo "$repoDir:$repoName:$1" >>  databases/branches.db
		echo "true"
	fi
}

function deleteBranch(){
	if grep -qF "$1" databases/branches.db
	then
		grep -v "$1" databases/branches.db > databases/branches.db.tmp
		cat databases/branches.db.tmp > databases/branches.db
		rm databases/branches.db.tmp
	    echo "true"
	else
	   echo "false"
	fi
}