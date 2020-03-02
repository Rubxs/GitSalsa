#Autor:Gines Carmona
#Condicional que se encarga de hacer la instalacion de git dependiendo del gestor de paquetes que tienes instalado 
function Installer(){
sudo apt-get update 2>control ##Si tiene el gestor apt
if [ $? -ne 0 ]; 
then
	error=errorGit
	if [ $error = errorGit ];
	then
		yum list updates 2>control ##Si tiene el gestor yum
		if [ $? -ne 0 ]; 
			then
			error=errorYum
	
				if [ $error = errorYum ];
					then
					zypper up 2>control ##Si tiene el gestor zypper
					if [ $? -ne 0 ];
						then
						error=errorZyper
						if [ $error = errorZyper ];
							then
							pacman -Syu 2>control ##Si tiene el gestor Pacman
							if [ $? -ne 0 ]; 
								then 
								echo No tienes ningun gestor de paquetes para instalar $1
							else
								rm control
								sudo pacman -S $1
							fi
						fi
					else 
						rm control
						sudo zypper install $1
						
					fi
				fi
				else 
					rm control
					sudo yum -y install $1			
		fi
	fi
else
	rm control
	sudo apt-get install $1

	
fi
}
