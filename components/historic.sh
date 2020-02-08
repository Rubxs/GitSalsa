# Autor: Rubén Herreros
# Función: 

# Cargando las funciones
. /home/ruben/Escritorio/gitsalsa/functions/filters.sh
. /home/ruben/Escritorio/gitsalsa/functions/log.sh

Titulo="Seleccionar tipo"
Pregunta="Selecciona una opción:"
Opciones=("Histórico" "Errores")

while opt="$(zenity --title="$Titulo" --text="$Pregunta" --list --column="Opciones" "${Opciones[@] $Versiones}")"; do
    case $opt in
        "${Opciones[0]}" )
            Titulo="Históricos"
            Pregunta="Selecciona una opción:"
            Opciones=("Filtros" "Listado")

            while opt="$(zenity --title="$Titulo" --text="$Pregunta" --list --column="Opciones" "${Opciones[@] $Versiones}")"; do
                case $opt in
                    "${Opciones[0]}" )
                        Titulo="Históricio - Filtro"
                        Pregunta="Selecciona una opción:"
                        Opciones=("Identificador" "Usuario" "Acción" "Mensaje")
                        
                        while opt="$(zenity --title="$Titulo" --text="$Pregunta" --list --column="Opciones" "${Opciones[@] $Versiones}")"; do
                            case $opt in
                                "${Opciones[0]}" )
                                    szAnswer=$(zenity --entry --text "Introduce Id"); echo "getFilter historic id "$szAnswer
                                ;;
                                "${Opciones[1]}")
                                    szAnswer=$(zenity --entry --text "Introduce Usuario"); echo "getFilter historic user "$szAnswer    
                                ;;
                                "${Opciones[2]}" )
                                    szAnswer=$(zenity --entry --text "Introduce Acción"); echo "getFilter historic action "$szAnswer            
                                ;;
                                "${Opciones[3]}")
                                    szAnswer=$(zenity --entry --text "Introduce texto"); echo "getFilter historic text "$szAnswer    
                                ;;
                                "${Opciones[-1]}")
                                    zenity --error --text="Opcion Incorrecta , Intenta con otra."
                                ;;
                            esac
                        done
                    ;;
                    "${Opciones[1]}")
                        echo "getAll historic" 
                    ;;
                    "${Opciones[-1]}")
                        zenity --error --text="Opcion Incorrecta , Intenta con otra."
                    ;;
                esac
            done
        ;;
        "${Opciones[1]}")
            Titulo="Errores"
            Pregunta="Selecciona una opción:"
            Opciones=("Filtros" "Listado")

            while opt="$(zenity --title="$Titulo" --text="$Pregunta" --list --column="Opciones" "${Opciones[@] $Versiones}")"; do
                case $opt in
                    "${Opciones[0]}" )
                        Titulo="Errro - Filtro"
                        Pregunta="Selecciona una opción:"
                        Opciones=("Identificador" "Usuario" "Acción" "Mensaje")
                        
                        while opt="$(zenity --title="$Titulo" --text="$Pregunta" --list --column="Opciones" "${Opciones[@] $Versiones}")"; do
                            case $opt in
                                "${Opciones[0]}" )
                                    szAnswer=$(zenity --entry --text "Introduce Id"); echo "getFilter error id "$szAnswer
                                ;;
                                "${Opciones[1]}")
                                    szAnswer=$(zenity --entry --text "Introduce Usuario"); echo "getFilter error user "$szAnswer    
                                ;;
                                "${Opciones[2]}" )
                                    szAnswer=$(zenity --entry --text "Introduce Acción"); echo "getFilter error action "$szAnswer            
                                ;;
                                "${Opciones[3]}")
                                    szAnswer=$(zenity --entry --text "Introduce texto"); echo "getFilter error text "$szAnswer    
                                ;;
                                "${Opciones[-1]}")
                                    zenity --error --text="Opcion Incorrecta , Intenta con otra."
                                ;;
                            esac
                        done
                    ;;
                    "${Opciones[1]}")
                        textZenity=`getAll error`
                        zenity --info --text "${textZenity}"
                    ;;
                    "${Opciones[-1]}")
                        zenity --error --text="Opcion Incorrecta , Intenta con otra."
                    ;;
                esac
            done
        ;;
        "${Opciones[-1]}")
            zenity --error --text="Opcion Incorrecta , Intenta con otra."
        ;;
    esac
done