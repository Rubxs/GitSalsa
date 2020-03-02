#Autor: Juan Esteban Roig Perez
#Funcionalidad: Pantalla de selección en el menú
. functions/log.sh
username=$(git config user.name)
email=$(git config user.email)
export repoDir=$(cut -f 1 -d ':' databases/repo.tmp)
export repoName=$(cut -f 2 -d ':' databases/repo.tmp)

if [[ -f databases/repo.tmp ]]; then
	menu=$(zenity --list --width=550 --height=250 --title "$username - $email" --column Acción "Abrir un repositorio" "Utilizar $repoName" "Crear uno o varios repositorios" "Ver historico" "Cerrar sesion ($username - $email)" "Salir" )
else
	menu=$(zenity --list --width=550 --height=260 --title "$username - $email" --column Acción "Abrir un repositorio" "Crear uno o varios repositorios" "Ver historico" "Cerrar sesion ($username - $email)" "Salir" )
fi


if [[ "$menu" == "Abrir un repositorio" ]]; then
    zenity --info --text "Ha seleccionado abrir un repositorio, a continuación seleccione el directorio donde se encuentra el repositorio"
    components/open-repository.sh
elif [[ "$menu" == "Crear uno o varios repositorios" ]]; then
    zenity --info --text "Ha seleccionado crear uno o varios repositorios, siga los pasos a continuación"
    components/create-repos.sh
elif [[ "$menu" == "Ver historico" ]]; then
	components/historic.sh
elif [[ "$menu" == "Salir" ]]; then
    echo "Salir"
elif [[ "$menu" == "Cerrar sesion ($username - $email)" ]]; then
    setLog historic $(git config user.name) login null logout
    git config --global --unset-all user.name
	git config --global --unset-all user.email
elif [[ "$menu" == "Utilizar $repoName"  ]]; then
	zenity --info --text "Usando $repoName en $repoDir"
	components/repository.sh
fi
