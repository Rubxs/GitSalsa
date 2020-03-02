#Autor: Juan Esteban Roig Perez
#Funcionalidad: Pantalla de creación de uno o varios repositorios
. functions/repository.sh
. functions/checkings.sh
. functions/log.sh

cantidad=$(zenity --entry --text "Cantidad de repositorios a crear")
tryCantidad=$(chkQty $cantidad 15 "repositorios")
if [[ $tryCantidad == "true" ]]; then
	let contador=$cantidad
	let buenos=0
	let malos=0
	losMalos=""
	while [[ $contador -ne 0 ]]; do
		nombre=$(zenity --entry --text "Nombre del repositorio")
		dir=$(zenity --file-selection --directory)
		func=$(createRepository $nombre $dir)
		if [[ $func == "Correcto" ]]; then
			let buenos=$buenos+1
		else
			let malos=$malos+1
			$losMalos="$losMalos - $nombre"
		fi
		let contador=contador-1
	done
	setLog historic $(git config user.name) repository $repoName create
	zenity --info --text "Se han creado $buenos repositorios e ignorado los $malos siguientes: $losMalos"
	components/menu.sh
else
	setLog error $(git config user.name) repository $repoName no_created
	zenity --error --text "$tryCantidad"
	components/create-repos.sh
fi
