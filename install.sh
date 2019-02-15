#
#===============================================================================
#
#          FILE: install.sh
#
#         USAGE: ./install.sh
#
#   DESCRIPTION:  If different (plugins/zsh/.zshrc & ~/.zshrc), offer to open/view differences, backup existing .zshrc and replace plugins/zsh/.zshrc to ~/.zshrc
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

SCRIPT_DIR=$(dirname $0)

if ! cmp -s ${SCRIPT_DIR}/plugins/zsh/.zshrc ${HOME}/.zshrc; then {
        echo "Files different!"
        read -r -p "Do you want to vimdiff the files? " confirmation
        if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then {
          : # Do nothing
        } else {
          echo "Running vimdiff"
          vimdiff ${SCRIPT_DIR}/plugins/zsh/.zshrc ~/.zshrc
        }
        fi
        echo "Copying ${HOME}/.zshrc to ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
        cp ${HOME}/.zshrc ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')

        echo "Overwriting ${HOME}/.zshrc with ${SCRIPT_DIR}/plugins/zsh/.zshrc"
        cp ${SCRIPT_DIR}/plugins/zsh/.zshrc ${HOME}/.zshrc
}
fi

