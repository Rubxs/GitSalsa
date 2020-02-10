#Autor:Gines Carmona
#Condicional que se encarga de hacer la instalacion de git dependiendo del gestor de paquetes que tienes instalado 
. ../functions/compr.sh

function InstallGit(){
sudo apt-get update  2>control ##Si tiene el gestor apt
if [ $? -ne 0 ]; 
then
	error=$(echo errorGit)
	setLog error (id) null install null Error_Instalacion
	if [ $error = errorGit ];
	then
		yum list updates 2>control ##Si tiene el gestor yum
		if [ $? -ne 0 ]; 
		then
			error=$(echo errorYum)
			setLog error (id) null install null Error_Instalacion
			if [ $error = errorYum ];
			then
					zypper up 2>control ##Si tiene el gestor zypper
					if [ $? -ne 0 ];
					then
						error=$(echo errorZyper)
						setLog error (id) null install null Error_Instalacion
						if [ $error = errorZyper ];
						then
							pacman -Syu 2>control ##Si tiene el gestor Pacman
							if [ $? -ne 0 ]; 
							then 
								setLog error (id) null install null Error_Instalacion
								echo No tienes ningun gestor de paquetes para instalar 'git'
							else
								rm control
								setLog historic (id) null install null Git_Instalado
								echo Pacman okey #sudo pacman -S git
							fi
						fi
					else 
						rm control
						setLog historic (id) null install null Git_Instalado
						echo Zyper okey #sudo zypper install git-core
						
					fi
				fi
			else 
				rm control
				setLog historic (id) null install null Git_Instalado
					echo Yum okey # sudo yum -y install git
					
				fi
			fi
		else
			rm control
			setLog historic (id) null install null Git_Instalado
			echo Get okey # sudo apt install git
	
fi
}
