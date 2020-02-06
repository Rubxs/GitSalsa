#Filtro que se encarga de encontrar que distribucion Linux tienes instalado en tu equipo
. ../functions/intallation.sh

distlinux=$(cat  /etc/*-release | tail -n+7 | head -n-9| cut -f2 -d=)

intall distlinux
