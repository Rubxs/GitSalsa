##Autor: Juan Esteban Roig Perez
#Funcionalidad: Pantalla de login al programa
. functions/login.sh

#pedir login
usuario=$(zenity --entry --text "Nombre de usuario")
email=$(zenity --entry  --text "Correo electronico")
funcLogin=`login $usuario $email`
zenity --info --text $funcLogin

if [[ "$funcLogin" == "Logeado" ]]; then
	./components/menu.sh
elif [[ "$funcLogin" == "Rellena todos los campos" ]]; then
	git config --global --unset-all user.name
	git config --global --unset-all user.email
fi
