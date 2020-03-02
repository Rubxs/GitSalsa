#Ignorar un archivo antes de commitear
#Autor Gines Carmona
function gitignore(){
	ori=$(zenity --file-selection --directory --title="Seleccione archivo")
	cd $ori
	if [ -d ".git" ]; then
		if [[ ! -f ".gitignore" ]]; then
			touch .gitignore
		fi
		arxi=$(zenity --title="Archivos a subir al gitignore" --entry --text "Cuantos archivos quieres subir")
		while [[ $arxi -ne 0 ]]; do
			let arxi=$arxi-1
			nom=$(zenity --file-selection --title="Seleccione archivo")
			nom2=$(basename $nom)
			cat .gitignore | grep "$nom2" 2>> error
				if [[ $? -eq 0 ]]; then
					echo $nom2 ya esta dentro .gitignore
					rm error
				else
					echo $nom2 >> .gitignore
					rm error
				
				fi
		done
		else
			echo No puedes usar el .gitignore en este directorio
fi
}
gitignore
