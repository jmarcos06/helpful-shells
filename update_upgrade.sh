#
# Author: Joao Marcos
# email: jmarcosalves06@gmail.com || dearauj@hotmail.com
#

#cores
SEM_COR='\e[0m'
VERDE='\e[1;92m'
VERMELHO='\e[1;91m'


updateUpgrade(){
    sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
}

updateUpgrade
echo "${VERDE}UPDATE, UPGRADE and DIST-UPGRADE complete sucesfully!"
