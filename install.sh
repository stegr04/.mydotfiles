#
#===============================================================================
#
#          FILE: install.sh
#
#         USAGE: ./install.sh
#
#   DESCRIPTION:  If different (SCRIPT_DIR/.zshrc & ~/.zshrc), offer to open/view differences, backup existing .zshrc and replace plugins/zsh/.zshrc to ~/.zshrc
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/15/2019 11:05:02
#      REVISION:  ---
#===============================================================================

#set -o nounset                                  # Treat unset variables as an error

SCRIPT_DIR="$(dirname $0)/plugins/myzsh"

if [ -f ${HOME}/.zshrc ]; then {

  if ! cmp -s ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc; then {
        echo "Differences detected: ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc"
	printf '%s ' 'Do you want to vimdiff the files? '
        read confirmation
        if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
          echo "Running vimdiff"
          vimdiff ${SCRIPT_DIR}/.zshrc ~/.zshrc
        }
        fi

	# So that I don't accidently lose change made to ~/.zshrc
        printf '%s ' "Do you want to overwrite ${HOME}/.zshrc with ${SCRIPT_DIR}/.zshrc? "
	read confirmation
	if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
		echo "Copying ${HOME}/.zshrc to ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
        	cp ${HOME}/.zshrc ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')

        	echo "Overwriting ${HOME}/.zshrc with ${SCRIPT_DIR}/.zshrc"
        	cp ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc
	}
	fi
  }
  fi
} else {
  cp ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc
}
fi

