#!/usr/bin/env bash
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
	echo -e "${GREEN} apt_update ran and finished ${NO_COLOR}"
}

programs_list=(
	"build-essential"
	"software-properties-common"
	"code"
	"git"
	"wget"
	"gparted"
	"tilix"
	"i3"
	"vlc"
	"synaptic"
	"timeshift"
	"gnome-sushi"
)

install_programs(){

echo -e "${GREEN}[INSTALLING...] --> Programs: ${NO_COLOR}"
for program_names in ${programs_list[@]}; do
	if ! dpkg -l | grep -q $program_names; then #it only install if you don't have it 
		sudo apt install "$program_names" -y
		echo -e "${GREEN}[INSTALLED] --> $program_names ${NO_COLOR}"
	else
		echo -e "${RED}[ALREADY INSTALLED] --> $program_names ${NO_COLOR}"
	fi
done
}

install_python(){
	echo -e 'Do you wanna install latest python version? [y/n]'
	read answer_python
	answer_python = ${answer_python^^}

	if  $answer_python == "Y"; then
		sudo add-apt-repository ppa:deadsnakes/ppa -y && sudo apt-get update && sudo apt-get install python3.8 -y && echo -e 'python3 installed'
	fi
}

install_neovim(){
	echo -e 'Do you wanna install neovim and lunarvim? [y/n]'
	read answer_neovim
	answer_neovim = ${answer_neovim^^}

	if  $answer_neovim == "Y"; then
		sudo apt install nodejs npm -y && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release && LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
	fi
}

install_flatpaks(){

  echo -e "${GREEN}[INFO] - Installing flatpak packages${NO_COLOR}"

flatpak install flathub org.gimp.GIMP -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub org.freedesktop.Piper -y
flatpak install flathub org.chromium.Chromium -y
flatpak install flathub org.gnome.Boxes -y
flatpak install flathub org.onlyoffice.desktopeditors -y
flatpak install flathub org.qbittorrent.qBittorrent -y

}

system_clean(){

apt_update -y
flatpak update -y
sudo apt autoclean -y
sudo apt autoremove -y
}



apt_update
install_programs
install_python
install_neovim
#install_flatpaks
system_clean

echo "${GREEN} [STATUS] -- Program ran until the end ${NO_COLOR}"