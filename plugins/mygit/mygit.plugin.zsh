#
#===============================================================================
#
#          FILE: mygit.plugin.zsh
#
#         USAGE: Gets loaded by oh-my-zsh custom plugins section
#
#   DESCRIPTION:  If different (SCRIPT_DIR/.gitignore & ~/.gitignore), offer to open/view differences, backup existing .gitignore and replace plugins/zsh/.gitignore to ~/.gitignore
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

SCRIPT_DIR="$(dirname $0)"

# HANDLE GITIGNORE
if [ -f ${HOME}/.gitignore ]; then {

  if ! cmp -s ${SCRIPT_DIR}/.gitignore ${HOME}/.gitignore; then {
        echo "Differences detected: ${SCRIPT_DIR}/.gitignore ${HOME}/.gitignore"
	printf '%s ' 'Do you want to vimdiff the files? '
        read confirmation
        if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
          echo "Running vimdiff"
          vimdiff ${SCRIPT_DIR}/.gitignore ~/.gitignore
        }
        fi

	# So that I don't accidently lose change made to ~/.gitignore
        printf '%s ' "Do you want to overwrite ${HOME}/.gitignore with ${SCRIPT_DIR}/.gitignore? "
	read confirmation
	if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
		echo "Copying ${HOME}/.gitignore to ${HOME}/.gitignore.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
        	cp ${HOME}/.gitignore ${HOME}/.gitignore.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')

        	echo "Overwriting ${HOME}/.gitignore with ${SCRIPT_DIR}/.gitignore"
        	cp ${SCRIPT_DIR}/.gitignore ${HOME}/.gitignore
	}
	fi
  }
  fi
} else {
  cp ${SCRIPT_DIR}/.gitignore ${HOME}/.gitignore
}
fi


# HANDLE GITIGNORE_GLOBAL
if [ -f ${HOME}/.gitignore_global ]; then {

  if ! cmp -s ${SCRIPT_DIR}/.gitignore_global ${HOME}/.gitignore_global; then {
        echo "Differences detected: ${SCRIPT_DIR}/.gitignore_global ${HOME}/.gitignore_global"
	printf '%s ' 'Do you want to vimdiff the files? '
        read confirmation
        if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
          echo "Running vimdiff"
          vimdiff ${SCRIPT_DIR}/.gitignore_global ~/.gitignore_global
        }
        fi

	# So that I don't accidently lose change made to ~/.gitignore_global
        printf '%s ' "Do you want to overwrite ${HOME}/.gitignore_global with ${SCRIPT_DIR}/.gitignore_global? "
	read confirmation
	if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
		echo "Copying ${HOME}/.gitignore_global to ${HOME}/.gitignore_global.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
        	cp ${HOME}/.gitignore_global ${HOME}/.gitignore_global.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')

        	echo "Overwriting ${HOME}/.gitignore_global with ${SCRIPT_DIR}/.gitignore_global"
        	cp ${SCRIPT_DIR}/.gitignore_global ${HOME}/.gitignore_global
	}
	fi
  }
  fi
} else {
  cp ${SCRIPT_DIR}/.gitignore_global ${HOME}/.gitignore_global
}
fi


if [ ! -f ${HOME}/.gitconfig ]; then {
  cp ${SCRIPT_DIR}/.gitconfig ${HOME}/.gitconfig
}
fi
