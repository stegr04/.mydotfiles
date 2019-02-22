# Set path to include my bin folder
export PATH=${PATH}:${HOME}/bin

# Added to offer colored text for pull functions. Not sure how the shell will react to these being set (since i believe these will not be available for ever terminal session that loads this plugin). 
	# ALTERNATIVE: Keep these commented and just use the asni escape codes. See: https://en.wikipedia.org/wiki/ANSI_escape_code
RESET=$'\e[0m'
YELLOW_HIGH=$'\e[1;33m\e[100m'
YELLOW=$'\e[1;33m'
GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
DONT_KNOW=$'\e[4;32'


# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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
	cd ~/cases
}

cdm() {
	cd ~/.mydotfiles
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
