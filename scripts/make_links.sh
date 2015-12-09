#!/bin/bash
# IN_PACKAGES (not used)
IN_PACKAGES=("i3" "vim" "zsh" "iceweasel")
S_LINKS=("${IN_PACKAGES[@]}" "screenlayout")
WORK_DIR=${1}

# Clone repo
if [[ ! -d ${WORK_DIR} ]]; then
	git clone https://github.com/fulljackz/dotfiles.git ${WORK_DIR}
fi

# Make links from config files (with backup)
for FOLD in "${S_LINKS[@]}" 
do
case $FOLD in
	i3)
		echo "Configuring i3"
		mv ~/.config/i3{,.bak}
		mkdir ~/.config/i3
		ln -s ${WORK_DIR}/i3/* ~/.config/i3/
		;;
	vim)
		echo "Configuring vim"
		mv ~/.vimrc{,.bak}
		ln -s ${WORK_DIR}/vim/vimrc ~/.vimrc
		;;
	zsh)
		echo "Configuring zsh"
		mv ~/.zshrc{,.bak}
		ln -s ${WORK_DIR}/zsh/zshrc ~/.zshrc
		;;
	iceweasel)
		echo "Configuring iceweasel for dark theme"
		ln -s ${WORK_DIR}/Iceweasel/userContent.css ~/.mozilla/firefox/*.default/chrome
		;;
esac
done
