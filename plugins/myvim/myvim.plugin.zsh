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
#set -eu -o pipefail
#set -u -o pipefail
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


script_dir=$(dirname $0)

# HANDLE .VIMRC IF/WHEN NECESSARY
if [ -f ${HOME}/.vimrc ]; then {

  if ! cmp -s ${script_dir}/.vimrc ${HOME}/.vimrc; then {
	warn "Difference detected: ${script_dir}/.vimrc ${HOME}/.vimrc"
	# Adding a check to see if reminders should be disabled. They are distracting after making a change. And on remote machines they might be a problem - not sure yet. But just in case I'm implementing this strategy 
	## of using a file with the disabled information specified inside of the file. This way if it needs to be permanently disabled at some point then it can be done with a -1 value inside of the file. 
	if [ -f ${script_dir}/disable.reminder ]; then {
		# The first ^ refers to the beginning of the line, so lines with comments starting after the first character will 
		## not be excluded. [^#;] means any character which is not # or ;.
		## In other words, it reports lines that start with any character other than # and ;. It's not the same as reporting the 
		## lines that don't start with # and ; (for which you'd use grep -v '^[#;]') in that it also excludes empty lines, but 
		## that's probably preferable in this case as I doubt you care about empty lines.
		disable_until_date_epoch=$(grep "^[^#;]" ${script_dir}/disable.reminder)
		#echo disable_until_date_epoch=${disable_until_date_epoch}
		current_date_epoch=$(date +%s)
		if [ ${current_date_epoch} -lt ${disable_until_date_epoch} ]; then {
			# If we're here then the disable_until_date_epoch time was greater than the current epoch time which means that the disable policy is still in effect. At this time we exit the script. 
			# I tried to use an exit 1 to exit the script. But that would cause the new shell/terminal to exit. 
			#exit 1
			: # Doing nothing
		}
		fi
	} else {
	  	# Offer review/remediation options
		printf '%s ' 'Do you want to vimdiff the files? ' 
		read confirmation
		if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then {
			# : # Do nothing
			printf '%s ' "Disable these notifications (good for testing for a period of time)?"
			read confirm_disable_notification
			if [ "${confirm_disable_notification}" != y ] && [ "${confirm_disable_notification}" != Y ]; then {
				: # Do nothing
			} else {
				printf '%s ' "How many days to disable [1|Enter]?"
				read disable_notification_days
				if [ ! -z "${disable_notification_days:-}" ]; then {
					: # Do nothing since the value is already set.
				} else {
					disable_notification_days=1
					# debug "no arguments detected."
				}
				fi
				# create a .remind file in the local plugin directory that this reminder is for. To be used, if present, to disable constant reminders because constant reminders are not helpful. Maybe what would be helpful is to instead offer to create a branch with the change, and write a commit message (which can be shown when a difference is detected) to remind me of what/why the change happened. 
				echo $(date -v +${disable_notification_days}d +%s) > ${script_dir}/disable.reminder
				echo "# $(date -v +${disable_notification_days}d +%s) = $(date -v +${disable_notification_days}d +%Y-%m-%d)" >> ${script_dir}/disable.reminder
			}
			fi
		} else {
			echo "Running vimdiff"
			vimdiff ${script_dir}/.vimrc ${HOME}/.vimrc; 
		}
		fi
			# So that I don't accidently lose change made to ~/.vimrc
			printf '%s ' "Do you want to overwrite ${HOME}/.vimrc with ${script_dir}/.vimrc? "
			read confirmation
			if [ "$confirmation" = y ] || [ "$confirmation" = Y ]; then {
			  echo "Copying ${HOME}/.vimrc to  ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
			  cp ${HOME}/.vimrc to  ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')
		 
			  echo "Overwriting ${HOME}/.vimrc with ${script_dir}/.vimrc"
			  cp ${script_dir}/.vimrc ${HOME}/.vimrc
			}
			fi
	}
	fi
  
} else {
	info "${script_dir}/.vimrc ${HOME}/.vimrc files were compared and are the same."
}
fi

} else {
  cp ${script_dir}/.vimrc ${HOME}/.vimrc
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
