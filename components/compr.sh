#Autor:Gines Carmona
#Verificar si git y zenity estan instalados en sistema operativo
ins=$(dpkg -l "git" | wc -l)
ins2=$(dpkg -l zenity | wc -l)

if [ $ins = "0" ];
then 
	InstallGit()
else 
	echo Ya tienes instalado git en tu equipo
fi

if [ $ins2 = "0" ];
then 
	InstallZenity()
else
	echo Ya tienes instalado zenity en tu equipo

fi
