#Autor: Juan Esteban Roig Perez
#Funcionalidad: Pantalla de selección en el menú
menu=$(zenity --list --title "Seleccione una opción" --column Acción "Abrir un repositorio" "Crear uno o varios repositorios" "Ver historico" "Salir" )


if [[ "$menu" == "Abrir un repositorio" ]]; then
    zenity --info --text "Ha seleccionado abrir un repositorio, a continuación seleccione el directorio donde se encuentra el repositorio"
    components/open-repository.sh
elif [[ "$menu" == "Crear uno o varios repositorios" ]]; then
    zenity --info --text "Ha seleccionado crear uno o varios repositorios, siga los pasos a continuación"
    components/create-repos.sh
elif [[ "$menu" == "Ver historico" ]]; then
	components/historic.sh
    echo 'Ver historico'
elif [[ "$menu" == "Salir" ]]; then
    echo "Salir"
fi
