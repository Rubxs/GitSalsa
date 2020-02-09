#Autor: Juan Esteban Roig Perez
#Funcionalidad: Abrir un repositorio existente.
. functions/repository.sh

repositorio=$(zenity --file-selection --directory)
funcRepo=$(openRepository $repositorio)
if [[ $funcRepo == "No repo" ]]; then
	zenity --error --text "El directorio seleccionado no es un repositorio"
	../app.sh
else
	export $repositorio
	export $funcRepo
fi