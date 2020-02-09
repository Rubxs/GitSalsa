#Autor: Juan Esteban Roig Perez
#Funcionalidad: Pantalla de creación de uno o varios repositorios
. functions/repository.sh

cantidad=$(zenity --entry --text "Cantidad de repositorios a crear")
let contador=$cantidad
let buenos=0
let malos=0
losMalos=""
while [[ $contador -ne 0 ]]; do
	nombre=$(zenity --entry --text "Nombre del repositorio")
	dir=$(zenity --file-selection --directory)
	func=$(createRepository $nombre $dir)
	if [[ $func == "Correcto" ]]; then
		let buenos=buenos+1
	else
		let malos=1
		$losMalos="$losMalos - $nombre"
	fi
	let contador=contador-1
done
zenity --info --text "Se han creado $buenos repositorios e ignorado los $malos siguientes: $losMalos"