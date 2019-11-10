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

# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# SECTION TO ASSIST WITH NAVIGATING CODE - CDD
cdar() {
	cd ~/.ansible/roles
}

cda() {
	cd ~/code/ansible
}

# SECTION TO ASSIST WITH NAVIGATING CODE - CDD
cdd() {
	cd ~/code/Docker
}

# SECTION TO ASSIST WITH NAVIGATING bin
cdb() {
	cd ~/bin
}

cdbc() {
	cd ~/bin/commands
}

# SECTION TO ASSIST WITH NAVIGATING rel
cdr() {
	cd ~/opt/ReleaseAutomationAnalysis
}

cdc() {
	cd ~/Box/cases
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

pullr() {
	printf '%\n' "${YELLOW}Doing a git pull of ReleaseAutomationAnalysis${RESET}"
	cd ~/opt/ReleaseAutomationAnalysis
	git pull
}

pullb() {
	printf '%\n' "${YELLOW}Doing a git pull of bin${RESET}"
	cd ~/bin
	git pull
}

pullb() {
	printf '%\n' "${YELLOW}Doing a git pull of Docker${RESET}"
	cd ~/code/Docker
	git pull
}

rlogg() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/loggrep.jar "$@"
}

rlogm() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/logmerge.jar "$@"
}

rlogr() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done

	printf '%s' "From Year [$(date "+%Y")]: "
	read FROM_YEAR
	if [[ -z ${FROM_YEAR} ]]; then
		FROM_YEAR=$(date "+%Y")
	fi
	echo $FROM_YEAR

	#read -a inputmonth -p $'\e[1;33m\e[100mMonth: \e[0m'
	#MONTH=${inputmonth:-$(date "+%m")}
	printf '%s' "From Month [$(date "+%m")]: "
	read FROM_MONTH
	if [[ -z ${FROM_MONTH} ]]; then
		FROM_MONTH=$(date "+%m")
	fi
	echo $FROM_MONTH

	#read -a inputday -p $'\e[1;33m\e[100mDay: \e[0m'
	#DAY=${inputday:-$(date "+%d")}
	printf '%s' "From Day [$(date "+%d")]: "
	read FROM_DAY
	if [[ -z ${FROM_DAY} ]]; then
		FROM_DAY=$(date "+%d")
	fi
	echo $FROM_DAY

	printf '%s' "From Time [ex: 00:00:00,000]: "
	read FROM_TIME
	while [ -z ${FROM_TIME} ]
	do
		printf '%s' "Begin Time [ex: 00:00:00,000]: "
		read FROM_TIME
	done
	echo $FROM_TIME
	
	echo -n "\n"

	printf '%s' "To Year [$(date "+%Y")]: "
	read TO_YEAR
	if [[ -z ${TO_YEAR} ]]; then
		TO_YEAR=$(date "+%Y")
	fi
	echo $TO_YEAR

	#read -a inputmonth -p $'\e[1;33m\e[100mMonth: \e[0m'
	#MONTH=${inputmonth:-$(date "+%m")}
	printf '%s' "To Month [$(date "+%m")]: "
	read TO_MONTH
	if [[ -z ${TO_MONTH} ]]; then
		TO_MONTH=$(date "+%m")
	fi
	echo $TO_MONTH

	#read -a inputday -p $'\e[1;33m\e[100mDay: \e[0m'
	#DAY=${inputday:-$(date "+%d")}
	printf '%s' "To Day [$(date "+%d")]: "
	read TO_DAY
	if [[ -z ${TO_DAY} ]]; then
		TO_DAY=$(date "+%d")
	fi
	echo $TO_DAY
	

	printf '%s' "To Time [ex: 00:00:00,000]: "
	read TO_TIME
	while [ -z ${TO_TIME} ]
	do
		printf '%s' "Begin Time [ex: 00:00:00,000]: "
		read TO_TIME
	done
	echo $TO_TIME

	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/logrange.jar "$@" ${FROM_YEAR}-${FROM_MONTH}-${FROM_DAY}T${FROM_TIME}Z ${TO_YEAR}-${TO_MONTH}-${TO_DAY}T${TO_TIME}Z
}

mx4jdump() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/mx4jdump-1.1-SNAPSHOT-jar-with-dependencies.jar "$@"
}

netdiag() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/chronos-tools/netdiag.jar "$@"
}


ratopology() {
	while [ ! -f "${CHRONOS_TOOLS}/logmerge.jar" ]
	do
		printf '%s\n' "CHRONOS_TOOLS directory location"
		read CHRONOS_TOOLS
		if [ -f "${CHRONOS_TOOLS}/logmerge.jar" ]; then 
			printf '%s\n' "Setting CHRONOS_TOOLS to ${CHRONOS_TOOLS}"
		else 
			printf '%s\n' "${CHRONOS_TOOLS}/logmerge.jar not found."
			printf '%s\n' "Downloading the tools google shared directory, via curl, seems to be a little unclear. Found this (https://github.com/tanaikech/goodls) but not sure how safe it is."
		       	printf '%s\n' "Download the files/folder from: https://drive.google.com/drive/folders/1glURkXemEvq3KN-9Qq-Vq25cLFzHuB1r"
			printf '%s\n' "Pausing while folder/files are downloaded/extracted. Press enter to proceed and get prompted again for location."
			read proceed
		fi
	done
	
	echo Arguments: "$@"
	java -jar ${CHRONOS_TOOLS}/ratopology-1.1-SNAPSHOT-jar-with-dependencies.jar "$@"
}

