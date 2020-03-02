#Autor: Juan Esteban Roig Perez
#Funcionalidad: Abrir un repositorio existente.
. functions/repository.sh
. functions/log.sh

repositorio=$(zenity --file-selection --directory)
funcRepo=$(openRepository $repositorio)
if [[ $funcRepo == "No repo" ]]; then
	setLog error $(git config user.name) repository null no_select
    zenity --error --text "El directorio seleccionado no es un repositorio"
    ./app.sh
else
	setLog historic $(git config user.name) repository null elect
    echo "${repositorio}:${funcRepo}" > databases/repo.tmp
    components/repository.sh
fi
