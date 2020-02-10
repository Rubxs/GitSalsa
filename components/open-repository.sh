#Autor: Juan Esteban Roig Perez
#Funcionalidad: Abrir un repositorio existente.
. functions/repository.sh

repositorio=$(zenity --file-selection --directory)
funcRepo=$(openRepository $repositorio)
if [[ $funcRepo == "No repo" ]]; then
    zenity --error --text "El directorio seleccionado no es un repositorio"
    ./app.sh
else
    echo "${repositorio}:${funcRepo}" > databases/repo.tmp
    menuRepo=$(zenity --list --title "Usando repositorio ${funcRepo}" --column Acción "Branches" "Commit" "Comparar cambios" "Salir" )
fi
