#!/bin/bash
#
#Author:  Joao Marcos
#email:   jmarcosalves06@gmail.com || dearauj@hotmail.com
#
#
# $ ./useful_fresh_setup.sh
#

#colours

RED='\e[1;91m'
GREEN='\e[1;92m'
NO_COLOR='\e[0m'

apt_update(){
	sudo apt update && sudo apt dist-upgrade -y && sudo apt ugprade -y
	echo '${GREEN} apt_update ran and finished ${NO_COLOR}'
}

programs_list=(

build-essential
software-properties-common
code
git
wget
gparted
tilix
i3
vlc


)

install_programs(){
for program_names in ${programs_list[@]}; do
	if ! dpkg -l | grep -q $program_names; then #it only install if you don't have it 
		sudo apt install "$program_names" -y
		echo '${GREEN}[INSTALLED] --> $program_names ${NO_COLOR}'
	else
		echo '${RED}[ALREADY INSTALLED] --> $program_names ${NO_COLOR}' 
	fi
done
}

install_python(){
	echo 'Do you wanna install latest python version? [y/n]'
	read answer_python

	if  "${answer_python^^}" == "Y"; then
		sudo add-apt-repository ppa:deadsnakes/ppa -y && sudo apt-get update && sudo apt-get install python3.8 -y && echo 'python3 installed'
	fi
}

install_neovim(){
	echo 'Do you wanna install neovim and lunarvim? [y/n]'
	read answer_neovim

	if  "${answer_neovim^^}" == "Y"; then
		sudo apt install nodejs npm -y && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release && LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)


	fi
}