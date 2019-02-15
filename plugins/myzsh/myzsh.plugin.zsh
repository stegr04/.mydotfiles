#
# I'm not sure what conditions I want to add when enabling this plugin. It should be a one-time plugin that I call maybe via a reload. 
# This folder will be used to store my solid, working master .zshrc file. 
#
# I may want to prompt that this will overwrite the existing zshrc and look into what is necessary to get it to be used. 
#
#
SCRIPT_DIR=${0}:A

if cmp -s ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc; then
	echo "Files different!"
	read -q "REPLY?Do you want to vimdiff the files?"
	if [ ${REPLY} == "y"* ]; then {
	  vimdiff ${SCRIPT_DIR}/.zshrc ~/.zshrc
	}
	fi
fi
echo "Copying ${HOME}/.zshrc to ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
cp ${HOME}/.zshrc ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')
cp ${SCRIPT_DIR}/.zshrc /.zshrc
