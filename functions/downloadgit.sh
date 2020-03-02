#Descagar los reopositorios de Github
#Autor Gines Carmona
name=$(zenity --title="Descargar un repositorio" --entry --text="Nombre de ese repositorio")
vec=$(zenity --title="Cuantas versiones quieres descargar" --entry --text="Numero de versiones (1-6)")
dest=$(ls ~|zenity --list --title "Seleccionar destino a guardar las versiones" --text "Seleccionar destino" --column "Destinos")
name2=$(echo $name | cut -d/ -f2)
cd ~/$dest
git clone https://github.com/$name.git
if [[ $vec -eq 1 ]]; then
	cd ~/$dest
	cp -r $name2 ~/$dest/$name2.$vec
else
	cd ~/$dest
	while [[ $vec -ne 0 ]]; do
		cp -r $name2 ~/$dest/$name2.$vec
		let vec=$vec-1
	done
fi

