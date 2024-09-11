#!/bin/bash

RED="\x1b[38;2;255;63;63m"
BLUE="\x1b[38;2;63;63;255m"
CYAN="\x1b[38;2;63;255;255m"
CODE="\x1b[38;2;255;255;63m"
RES="\x1b[0m"

# if [ "$EUID" -ne 0 ]; then
# 	echo -e "${RED}run this script with root permission${RES}"
# 	echo -e "\t$ ${CODE}sudo ./start.sh${RES}"
# 	exit 1
# fi

ph() {
	local input="$*"
	echo -e "$RED$input$RES"
}
pstep() {
	local input="$*"
	echo -e "> $CYAN$input$RES"
}
pcmd() {
	local input="$*"
	echo -e "\t$ $CODE$input$RES"
	eval "$input"
}
pcmdconfirm() {
	local input="$*"
	echo -e "\t$ $CODE$input$RES"
#	echo -e "\t${CYAN}eseguire [Y/n]?$RES"
	read -r -n 1 -i "n" -p "        eseguire [Y/n]?" choice
	if [[ -z "$choice" ]]; then
		eval "$input"
	elif [[ ! "$choice" =~ ^[Nn]$ ]]; then
		echo ''
		eval "$input"
	else
		echo ''
		echo 'comando non eseguito'
	fi
}

ph "Remove useless tools"
pcmd "sudo apt remove nano vim"

ph "Install useful tools"
pcmd "sudo apt install -y ripgrep yarn git python3 python3-pip neofetch tree plocate"

ph "Setting up neovim"
pcmd "snap install nvim"
pcmd "sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
pcmd "rm ~/.config/nvim -r"
pcmd "cp nvim ~/.config -r"

ph "Copy files"
pcmd "cp .bashrc ~"
pcmd "cp .gitconfig ~"

ph "Terminal refresh"
pcmdconfirm "clear && source ~/.bashrc"
