##Autor: Juan Esteban Roig Perez
#Funcionalidad: Funciones para el login

function login(){
	username=$1
	email=$2
	if [[ $# -eq 2 ]]; then
		git config --global user.name $username
		git config --global user.email $email
		echo "Logeado"
	else
		echo "Rellena todos los campos"
	fi
}