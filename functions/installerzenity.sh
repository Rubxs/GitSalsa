#Autor:Gines Carmona
#Condicional que se encarga de hacer la instalacion de zenity dependiendo del gestor de paquetes que tienes instalado 
. ../functions/compr.sh

function InstallZenity(){
sudo apt-get update  2>control ##Si tiene el gestor apt
if [ $? -ne 0 ]; 
then
	error=$(echo errorGit)
	setLog error (id) null install null Error_Instalacion_Zenity
	if [ $error = errorGit ];
	then
		sudo yum list updates 2>control ##Si tiene el gestor yum
		if [ $? -ne 0 ]; 
		then
			error=$(echo errorYum)
			setLog error (id) null install null Error_Instalacion_Zenity
			if [ $error = errorYum ];
			then
					sudo zypper up 2>control ##Si tiene el gestor zypper
					if [ $? -ne 0 ];
					then
						error=$(echo errorZyper)
						setLog error (id) null install null Error_Instalacion_Zenity
						if [ $error = errorZyper ];
						then
							sudo pacman -Syu 2>control ##Si tiene el gestor Pacman
							if [ $? -ne 0 ]; 
							then 
								setLog error (id) null install null Error_Instalacion_Zenity
								echo No tienes ningun gestor de paquetes para instalar 'git'
							else
								rm control
								setLog historic (id) null install null Zenity_Instalado
								echo sudo pacman -S zenity
							fi
						fi
					else 
						rm control
						setLog historic (id) null install null Zenity_Instalado
						echo sudo zypper install zenity
						
					fi
				fi
			else 
				rm control
				setLog historic (id) null install null Zenity_Instalado
					echo sudo yum -y install zenity
					
				fi
			fi
		else
			rm control
			setLog historic (id) null install null Zenity_Instalado
			echo sudo apt install zenity
	
fi
}
