#!/bin/bash

# NOMBRE DEL SCRIPT: 'tar.sh'

# CREADOR: el_de_la_cuadra
# TIPO: script
# LANZAMIENTO: 03-07-2025

# Variable.
usuario=$(whoami)

# Ejecutar colores normales.
verde="\e[3;1;32m"
azul="\e[3;1;36m"
rojo="\e[3;1;31m"
amarillo="\e[3;1;33m"
morado="\e[3;1;35m"
gris="\e[3;1;37m"
reset="\e[0m"

# Ejecutar colores parpadeantes.
parpadeo_rojo="\e[5;1;31m"
parpadeo_gris="\e[5;1;37m"
parpadeo_amarillo="\e[5;1;33m"
parpadeo_verde="\e[5;1;32m"
parpadeo_azul="\e[5;1;36m"


# Llamamos ha esta funcion desde el trap finalizar SIGINT ( En caso de que el usuario precione control + c para salir del script ).
finalizar() {
     echo ""
     echo -e "${amarillo}Finalizando script${parpadeo_gris}...${reset}"
     sleep 3
     echo ""
}

trap finalizar SIGINT

# Ejecutar banner.
mi_banner() {
   clear
   echo -e "${amarillo}"
   figlet "Docker Machines"
   echo -e "${verde}Creador: ${reset}el_de_la_cuadra  ${verde}Lanzamiento: ${reset}03-07-2025"
   echo ""
   echo -e "${gris}"
}

# Conceder permisos de super usuario.
if [ $(id -u) -ne 0 ]; then
       mi_banner
       echo -e "${gris}Necesita permisos de super usuario.(${parpadeo_rojo}!${reset}${gris})${reset}"
exit

fi


# Probar maquina.
mi_banner
echo -e "${amarillo}-> ${gris}Probar maquina ${amarillo}<-${reset}"
echo ""
ls
echo -e "${gris}"
read -p "Nombre de archivo .tar que desea probar.? " nombre_tar
sleep 1
echo ""
echo -e "${verde}EJECUTANDO MAQUINA VIRTUAL${parpadeo_gris}...${reset}"
sleep 3
echo ""

bash run.sh $nombre_tar

exit 2

