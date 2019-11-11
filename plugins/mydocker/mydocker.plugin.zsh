cdd() {
	cd ~/code/Docker
}

pullb() {
	printf '%\n' "${YELLOW}Doing a git pull of Docker${RESET}"
	cd ~/code/Docker
	git pull
}
