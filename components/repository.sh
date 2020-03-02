# Autor: Juan Esteban Roig Perez
# Funcionalidad: Menú de repositorios

menuRepo=$(zenity --list --width=550 --height=250 --title "Usando repositorio ${funcRepo}" --column Acción "Branches" "Commit" "Comparar cambios" "Pull a origen" "Salir" )
if [[ $menuRepo == "Branches" ]]; then
	components/branches.sh
elif [[ $menuRepo == "Commit" ]]; then
	components/commit.sh
elif [[ $menuRepo == "Comparar cambios" ]]; then
	components/compare.sh
elif [[ $menuRepo == "Pull a origen" ]]; then
	components/pull.sh
fi