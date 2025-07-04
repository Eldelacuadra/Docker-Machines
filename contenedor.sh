#!/bin/bash

# NOMBRE DEL SCRIPT: 'contenedor.sh'

# CREADOR: el_de_la_cuadra
# TIPO: script
# Lanzamiento: 03-07-2025

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
       echo -e "${gris}Necesitas permisos de super usuario.(${parpadeo_rojo}!${reset}${gris})${reset}"

exit

fi

# Ejecutar script.
mi_banner
echo -e "${gris}[ ${verde}Imagenes Disponibles ${gris}]"
echo ""
docker images
echo -e "${gris}"
read -p "Coloque la ID de la imagen que desea arrancar.? " id
sleep 1
echo ""
echo -e "${amarillo}Ejecutando Contenedor${gris}...${reset}"
sleep 3
echo ""
echo -e "${azul}Empiece Ha Crear Su Maquina Y Guarde El Proceso En La Primera Ventana De La Terminal.${reset}"
echo ""
echo -e "${rojo}Escriba (${gris}exit${rojo}) Si Desea Salir Del Script.${reset}"
echo ""

# Ejecutar contenedor.
docker run -it $id
