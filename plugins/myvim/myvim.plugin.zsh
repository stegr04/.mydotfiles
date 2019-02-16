#
#===============================================================================
#
#          FILE: vim.plugin.zsh
#
#         USAGE: Gets loaded by oh-my-zsh custom plugins section
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
#echo SHELL=$SHELL

SCRIPT_DIR=$(dirname $0)

# HANDLE .VIMRC IF/WHEN NECESSARY
if [ -f ${HOME}/.vimrc ]; then {

  if ! cmp -s ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc; then {
	  echo "Difference detected: ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc"
	  printf '%s ' 'Do you want to vimdiff the files? ' 
	  read confirmation
	  if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then {
            : # Do nothing
          } else {
            echo "Running vimdiff"
            vimdiff ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc; 
          }
          fi
	  
	  # So that I don't accidently lose change made to ~/.vimrc
	  printf '%s ' "Do you want to overwrite ${HOME}/.vimrc with ${SCRIPT_DIR}/.vimrc? "
	  read confirmation
	  if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
		  echo "Copying ${HOME}/.vimrc to  ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
		  cp ${HOME}/.vimrc to  ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')
  
		  echo "Overwriting ${HOME}/.vimrc with ${SCRIPT_DIR}/.vimrc"
		  cp ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc
          }
          fi
  
  }
  fi

} else {
  cp ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc
}
fi


# HANDLE CREATING .vim/bundle FOLDER AND GET VUNDLE
if [ ! -d ${HOME}/.vim ]; then {
  printf '%s ' 'No .vim folder found. Create it and try to git clone Vundle? '
  read confirmation
  if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
    mkdir -p ${HOME}/.vim/bundle
    if git --version; then {
      git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
    } else {
      echo "git --version command returned rc greater than 0. Check to make sure git is installed."
    }
    fi
  }
  fi
}
fi
