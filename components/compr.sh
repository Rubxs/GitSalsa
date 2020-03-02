#Autor:Gines Carmona
#Verificar si git y zenity estan instalados en sistema operativo
. ../functions/installer.sh
zenity --question --text "Instalacion GitSalsa"
comp=$(echo $?)
function insta(){
	if [[ $1 = "0" ]]; then
		ins=$(dpkg -l "git" | wc -l)
		ins2=$(dpkg -l zenity | wc -l)
		if [ $ins2 = "0" ];
			then 
				echo `Installer zenity`
			else 
				echo Ya tienes instalado Zenity en tu equipo
			fi

			if [ $ins = "0" ];
			then 
				echo `Installer git`
			else 
			echo Ya tienes instalado git en tu equipo
			fi
		else
			exit	
	fi			
}	
insta $comp
