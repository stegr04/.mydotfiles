# Set path to include my bin folder
export PATH=${PATH}:${HOME}/bin:${HOME}/bin/SSL_Cert_Scripts
export CHRONOS_TOOLS=${HOME}/opt/chronos-tools

# Added to offer colored text for pull functions. Not sure how the shell will react to these being set (since i believe these will not be available for ever terminal session that loads this plugin). 
	# ALTERNATIVE: Keep these commented and just use the asni escape codes. See: https://en.wikipedia.org/wiki/ANSI_escape_code
RESET=$'\e[0m'
YELLOW_HIGH=$'\e[1;33m\e[100m'
YELLOW=$'\e[1;33m'
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
DONT_KNOW=$'\e[4;32'

function title {
	echo -ne "\033]0;"$*"\007" # found this here: https://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs
}

# SECTION TO ASSIST WITH NAVIGATING bin
cdb() {
	cd ~/bin
}

cdbc() {
	cd ~/bin/commands
}

cdh() {
	cd ~
}

cdm() {
	cd ~/.mydotfiles
}

cdi() {
	cd ~/Images
}

pullm() {
	printf '%\n' "${YELLOW}Doing a git pull of .mydotfiles${RESET}"
	cd ~/.mydotfiles
	git pull
}

pullb() {
	printf '%\n' "${YELLOW}Doing a git pull of bin${RESET}"
	cd ~/bin
	git pull
}

clearLess() {
	rm ${HOME}/.lesshst
}


