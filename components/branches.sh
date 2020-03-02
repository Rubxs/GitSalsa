#Autor: Juan Esteban Roig Perez
#Funcionalidad: Opciones para la gestión de ramas
. functions/branches.sh
. functions/checkings.sh
. functions/log.sh

branchMenu=$(zenity --list --width=550 --height=250 --title "$username - $email" --column Acción "Crear una/varias ramas" "Listar ramas" "Eliminar una rama" )

if [[ $branchMenu == "Crear una/varias ramas" ]]; then
	cantidadRamas=$(zenity --entry --text "Cantidad de ramas a crear")
	tryCantidadRamas=$(chkQty $cantidadRamas 15 "ramas")
	if [[ $tryCantidadRamas == "true" ]]; then
		echo "dentro del if"
		let contadorRamas=$cantidadRamas
		let ramasBuenas=0
		let ramasMalas=0
		while [[ $contadorRamas -ne 0 ]]; do
			echo "dentro del while"
			nombreRama=$(zenity --entry --text "Nombre de la rama")
			crearRama=$(newBranch $nombreRama)
			if [[ $crearRama == "true" ]]; then
				let ramasBuenas=$ramasBuenas+1
			else
				let ramasMalas=$ramasMalas+1
			fi
			let contadorRamas=$contadorRamas-1
		done
		setLog historic $(git config user.name) branches $repoName created
		zenity --info --text "Se han creado $ramasBuenas ramas e ignorado $ramasMalas"
	else
		setLog error $(git config user.name) branches $repoName no_created
		zenity --error --text "$tryCantidadRamas"
	fi
	components/branches.sh
elif [[ $branchMenu == "Listar ramas" ]]; then
	grep "$repoDir:$repoName" databases/branches.db | cut -f 3 -d ':' > databases/tmpbranch.tmp
	zenity --text-info --title="Branches de $repoName" --filename=databases/tmpbranch.tmp
	rm databases/tmpbranch.tmp
	setLog historic $(git config user.name) branches $repoName list

	components/branches.sh
elif [[ $branchMenu == "Eliminar una rama" ]]; then
	branchToDelete=$(zenity --entry --text "Branch a borrar")
	funcEliminar=$(deleteBranch $repoDir:$repoName:$branchToDelete)
	if [[ $funcEliminar == "false" ]]; then
		setLog historic $(git config user.name) branches $repoName delete
		zenity --error --text "La rama $branchToDelete no existe en el repositorio $repoName"
	elif [[ $funcEliminar == "true" ]]; then
		setLog error $(git config user.name) branches $repoName no_delete
		zenity --info --text "Se ha eliminado la rama $branchToDelete del repositorio $repoName"
	fi
	components/branches.sh
fi