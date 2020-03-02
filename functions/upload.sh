#Subir archivos a github
#Autor Gines Carmona
function upload(){
if [ -d ".git" ]; then
	arxi=$(zenity --title="Archivos a subir al repositorio" --entry --text "Cuantos archivos quieres subir")
 	while [[ $arxi -ne 0 ]]; do
 		let arxi=$arxi-1
 		nom=$(zenity --file-selection --title="Seleccione archivo")
 		if [[ -f $nom ]]; then
 			 echo git add $nom
 		else
 			echo El archivos selecionado $nom no existen en este equipo
 			exit
 		fi
 		
 	done

 	zenity --question --text "¿Quieres comprobar el estado de stagigng index?"
 	if [[ $? -eq 0 ]]; then
 		git status
 		uploadgit
 			else
 				uploadgit
 	fi
 else
 	echo Esta carpeta no contien un repositorio git
fi 

}
function uploadgit(){
	$(zenity --question --text "¿Subir repositorios a Github?")
 		if [[ $? -eq 0 ]]; then
 			echo Introducir mensaje para el cuerpo del commit:
 			read mens
 			git commit -m $mens
 			git push origin master
 		fi
}
upload
