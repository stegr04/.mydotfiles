# Set path to include my bin folder
export PATH=${PATH}:${HOME}/bin

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

# SECTION TO ASSIST WITH NAVIGATING rel
cdr() {
	cd ~/opt/ReleaseAutomationAnalysis
}

