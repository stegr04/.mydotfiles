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
set -eu -o pipefail
# SET COLOR CODES
reset=$'\e[0m'
yellow_high=$'\e[1;33m\e[100m'
yellow=$'\e[1;33m'
green=$'\e[0;32m'
red=$'\e[0;31m'
orange=$'\e[38;5;202m'
info=$'\e[38;5;116m'    #Light blue
debug=$'\e[38;5;260m'   #Dark Blue

### Logging

function prompt() {
	        printf '\n%s ' "${yellow_high}PROMPT${reset} $@"
}

function fatal() {
	    printf '%s\n' "${red}FATAL: $@${reset}"
}

function fatalex() {
	    fatal "$@"
	        exit 2
}

function info() {
	    printf '%s\n' "${green}=> $@${reset}"
}

function warn() {
	    echo "${yellow}WARN: $@${reset}"
}

function stage() {
	    echo "=== $@"
}

function debug() {
	    echo "${debug}DEBUG: $@${reset}"
	        return 0
}

function error() {
	    echo "${orange}ERROR: $@${reset}"
}

function assert_cmd_available() {
    	local cmd="${1:-}"
    	[ -z "${cmd}" ] && fatalex "is_cmd_available() is missing the cmd argument"
    	#"$cmd" --help 1>/dev/null 2>&1 0</dev/null || fatalex "'$cmd' is not available, exiting"
    	command -v "$cmd" 1>/dev/null 2>&1 0</dev/null || fatalex "'$cmd' is not available, exiting"
	info "'$cmd' ok"
}

if [ ! -z "${1:-}" ]; then {
	debug "argument detected: ${1}"
	if [ "$1" == "--unattended" ]; then {
		unattended=true
	} else {
		unattended=false
	}
	fi
} else {
	debug "no arguments detected."
	unattended=false
}
fi


SCRIPT_DIR=$(dirname $0)

# HANDLE .VIMRC IF/WHEN NECESSARY
if [ -f ${HOME}/.vimrc ]; then {

  if ! cmp -s ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc; then {
	  warn "Difference detected: ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc"
	  if [ "$unattended" == "false" ]; then {
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
	} elif [ "$unattended" == "true" ]; then {
		echo "Copying ${HOME}/.vimrc to  ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
		  cp ${HOME}/.vimrc to  ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')
	 
		  echo "Overwriting ${HOME}/.vimrc with ${SCRIPT_DIR}/.vimrc"
		  cp ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc
	}
	fi
  
  } else {
	info "${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc files were compared and are the same."
  }
  fi

} else {
  cp ${SCRIPT_DIR}/.vimrc ${HOME}/.vimrc
}
fi


# HANDLE CREATING .vim/bundle FOLDER AND GET VUNDLE
#if [ ! -d ${HOME}/.vim ]; then {
#  printf '%s ' 'No .vim folder found. Create it and try to git clone Vundle? '
#  read confirmation
#  if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
#    mkdir -p ${HOME}/.vim/bundle
#    if git --version; then {
#      git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
#    } else {
#      echo "git --version command returned rc greater than 0. Check to make sure git is installed."
#    }
#    fi
#  }
#  fi
#}
#fi
