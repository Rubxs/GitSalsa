##Autor: Juan Esteban Roig Perez
#Funcionalidad: Pantalla de login al programa
. functions/login.sh
. functions/log.sh

export username=$(git config user.name)
email=$(git config user.email)
echo "$username - $password"
if [[ $username == "" ]] || [[ $email == "" ]]; then
	#pedir login
	usuario=$(zenity --entry --text "Nombre de usuario")
	email=$(zenity --entry  --text "Correo electronico")
	funcLogin=`login $usuario $email`
	zenity --info --text $funcLogin
	if [[ "$funcLogin" == "Logeado" ]]; then
		setLog historic $username login null user_login
		./components/menu.sh
	elif [[ "$funcLogin" == "Rellena todos los campos" ]]; then
		git config --global --unset-all user.name
		git config --global --unset-all user.email
	fi
else
	zenity --info --text "Logeado como $username - $email"
	setLog historic $username login null user_login
	./components/menu.sh
fi

