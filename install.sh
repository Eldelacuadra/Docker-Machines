#!/bin/bash

# CREADOR: el_de_la_cuadra
# TIPO: instalacion
# LANZAMIENTO: 03-07-2025

# Ejecutar colores normales.
verde="\e[3;1;32m"
azul="\e[3;1;34m"
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
parpadeo_azul="\e[5;1;34m"

# CONCEDER PERMISOS DE SUPER USUARIO.
if [ $(id -u) -ne 0 ]; then
       echo -e "${amarillo}-> ${gris}INSTALACION DE DOCKER MACHINES ${amarillo}<-${reset}"
       echo ""
       echo -e "${gris}La Instalacion Necesita Permisos De Super Usuario.(${parpadeo_rojo}!${reset}${gris})${reset}"

exit

fi

# INSTALAR DEPENDENCIAS.
if [ "$(echo $?)" == "0" ]; then
        clear
        echo -e "${rojo}INSTALANDO DEPENDENCIAS.${reset}"
        echo ""
        echo ""
        echo -e "${gris}(${parpadeo_verde}*${reset}${gris})${verde}Actualizando terminal${gris}...${reset}"
        echo ""
        apt update
        echo ""
        echo -e "${gris}(${parpadeo_verde}*${reset}${gris})${verde}Instalando docker.io${gris}...${reset}"
        echo ""
        apt install docker.io -y
        echo ""
        echo -e "${gris}(${parpadeo_verde}*${reset}${gris})${verde}Instalando gnome-terminal${gris}...${reset}"
        echo ""
        apt install gnome-terminal -y
        echo ""
        echo -e "${gris}(${parpadeo_verde}*${reset}${gris})${verde}Instalando figlet${gris}...${reset}"
        echo ""
        apt install figlet -y
        echo ""
        echo -e "${azul}DEPENDENCIAS INSTALADAS.${reset}"
        sleep 5
        echo ""
        echo -e "${amarillo}Ahora puede ejecutar la herramienta correctamente. ${gris}:)${reset}"
        exit

fi


