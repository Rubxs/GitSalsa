#Autor:Gines Carmona
#Comprobacion para saber si el usuario tiene permisos de jecucion sobre carpeta/archivo
per=$1
function permisos(){
	if [[ -x $per ]]; then
		echo Tienes permisos de ejecucion sobre $per
	else
		echo No tienes permisos de ejecucion sobre $per
	fi
}

permisos
