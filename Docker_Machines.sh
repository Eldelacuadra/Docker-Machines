#!/bin/bash

# NOMBRE DEL SCRIPT: 'Docker_Machines.sh'

# CREADOR: el_de_la_cuadra
# TIPO: script
# LANZAMIENTO: 03-07-2025

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
       echo -e "${gris}Necesita permisos de super usuario.(${parpadeo_rojo}!${reset}${gris})${reset}"
       echo ""
       echo -e "${verde}$ ${gris}sudo bash Docker_Machines.sh${reset}"

exit

fi

# Ejecutar script.
mi_banner
read -p "Presione [enter] para Continuar"
sleep 2
echo ""
echo -e "${gris}(${parpadeo_amarillo}*${reset}${gris})Descargando Imagen...${reset}"
echo ""
docker pull ubuntu:latest
echo ""
echo -e "${azul}Imagen Descargada.${reset}"
echo ""
echo -e "${morado}Ejecutando Nueva Ventana De Terminal${gris}...${reset}"
sleep 1

# Ejecutar nueva ventana de terminal.
gnome-terminal --geometry=568:425 -- bash -c './contenedor.sh' &
echo ""
echo -e "${amarillo}POR FAVOR EJECUTE EL CONTENEDOR.${reset}"
sleep 30
echo ""
echo -e "${gris}[ ${verde}Estos Son Los Contenedores Disponibles ${gris}]${reset}"
echo ""
docker ps
echo -e "${gris}"
read -p "Introduce la ID del contenedor para guardar el proceso.? " contenedor
sleep 1
echo -e "${reset}"
docker commit $contenedor ubuntu:latest
echo -e "${reset}"
sleep 1
echo -e "${gris}"
read -p "Introduce el nombre para la imagen.? " nombre_final
sleep 1
echo -e "${reset}"

bash -c 'echo "FROM ubuntu:latest" && echo "RUN apt update && apt install apache2 -y && apt install openssh-server -y" && echo "CMD service apache2 start && service ssh start && tail -f >/dev/null"' >> Dockerfile && docker build --tag $nombre_final .

echo ""
echo -e "${gris}[ ${verde}Estas Son Las Imagenes Disponibles ${gris}]${reset}"
echo ""
docker images
echo -e "${gris}"
read -p "Nombre para el archivo .tar.? " nombre_tar
sleep 1
echo ""
read -p "Nombre de la imagen que desea convertir en formato tar.? " nombre_imagen
sleep 1
echo -e "${reset}"
echo -e "${gris}(${parpadeo_azul}*${reset}${gris})${azul}Guardando Progreso De La Imagen, Por Favor Espere Un Momento${gris}...${reset}"
sleep 3
echo ""
docker save -o $nombre_tar $nombre_imagen
echo ""
echo -e "${gris}[ ${morado}IMAGEN GUARDADA ${gris}]${reset}"
sleep 2
echo ""
echo -e "${gris}(${parpadeo_verde}*${reset}${gris})${morado}Ejecutando Nueva Ventana De Terminal${gris}...${reset}"
sleep 3

# Ejecutar nueva ventana de terminal.
gnome-terminal --geometry=568:425 -- bash -c './tar.sh' &

rm Dockerfile

echo ""
echo -e "${amarillo}(${gris}G${amarillo})racias por su preferencia${gris}. :)${reset}"
exit

