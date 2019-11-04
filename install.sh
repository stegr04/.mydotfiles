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

SCRIPT_DIR="$(dirname $0)/plugins/myzsh"

if [ -f ${HOME}/.zshrc ]; then {

  if ! cmp -s ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc; then {
        warn "Differences detected: ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc"
	if [ "$unattended" == "false" ]; then {
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
	} elif [ "$unattended" == "true" ]; then {
		echo "Copying ${HOME}/.zshrc to ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
        	cp ${HOME}/.zshrc ${HOME}/.zshrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')

       		echo "Overwriting ${HOME}/.zshrc with ${SCRIPT_DIR}/.zshrc"
       		cp ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc
	}
	fi
  } else {
  	info "${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc files were compared and are the same."
  }
  fi
} else {
  cp ${SCRIPT_DIR}/.zshrc ${HOME}/.zshrc
}
fi

