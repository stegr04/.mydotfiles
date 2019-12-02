#
#===============================================================================
#
#          FILE: tmux.plugin.zsh
#
#         USAGE: Gets loaded by oh-my-zsh custom plugins section
#
#   DESCRIPTION:  If different (plugins/mytmux/.tmux.conf & ~/.tmux.conf), offer to open/view differences, backup existing .tmux.conf and replace plugins/zsh/.tmux.conf to ~/.tmux.conf
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

reset=$'\e[0m'
yellow_high=$'\e[1;33m\e[100m'
yellow=$'\e[1;33m'
green=$'\e[0;32m'
red=$'\e[0;31m'
orange=$'\e[38;5;202m'
info=$'\e[38;5;116m'    #Light blue
debug=$'\e[38;5;260m'   #Dark Blue

script_dir="$(dirname $0)"
homefile=${HOME}/.tmux.conf
pluginfile=${script_dir}/.tmux.conf


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

function handle_diffs() {
	  # Offer review/remediation options
		#printf '%s ' 'Do you want to vimdiff the files? ' 
		printf '%s ' "View differences [v], Accept changes in ${homefile} [a], Restore plugin file ${pluginfile} [r] or Disable notifications [d|Enter]? "
		read howtohandlediffs
		# If response not equal to "yes" 
		if [ "$howtohandlediffs" = "v" ] || [ "$howtohandlediffs" = "V" ]; then {
			info "Running vimdiff ${homefile} ${pluginfile};"
			vimdiff ${homefile} ${pluginfile};
		} elif [ "$howtohandlediffs" = "a" ] || [ "$howtohandlediffs" = "A" ]; then {
			info "Replacing ${pluginfile} with ${homefile}"
			cp ${homefile} ${pluginfile}
		} elif [ "$howtohandlediffs" = "r" ] || [ "$howtohandlediffs" = "R" ]; then {
			info "Copying ${homefile}  to  ${homefile}.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')"
			cp ${HOME}/.vimrc ${HOME}/.vimrc.bak.$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')
			info "Replacing ${homefile}  with  ${pluginfile}"
			cp ${pluginfile} ${homefile}
		} elif [ "$howtohandlediffs" = "d" ] || [ "$howtohandlediffs" = "D" ] || [ -z ${howtohandlediffs} ]; then {
			printf '%s ' "How many days to disable [1|Enter]?"
			read disable_notification_days
			# -Z evaluates to true if variable is not set. This is saying if variable is set then do nothing since its value is caught by the read. 
			if [ ! -z "${disable_notification_days:-}" ]; then {
				: # Do nothing since the value is already set.
			} else {
				disable_notification_days=1
			}
			fi
			# create a .remind file in the local plugin directory that this reminder is for. To be used, if present, to disable constant reminders because constant reminders are not helpful. Maybe what would be helpful is to instead offer to create a branch with the change, and write a commit message (which can be shown when a difference is detected) to remind me of what/why the change happened. 
			echo $(date -v +${disable_notification_days}d +%s) > ${script_dir}/disable.reminder
			echo "# $(date -v +${disable_notification_days}d +%s) = $(date -v +${disable_notification_days}d +%Y-%m-%d)" >> ${script_dir}/disable.reminder
		}
		fi 
}


# HANDLE .TMUX.CONF IF/WHEN NECESSARY
if [ -f ${homefile} ]; then {
  if ! cmp -s ${pluginfile} ${homefile}; then {
    warn "Differences detected: ${pluginfile} ${homefile}"

  	if [ -f ${script_dir}/disable.reminder ]; then {
      disable_until_date_epoch=$(grep "^[^#;]" ${script_dir}/disable.reminder)
		  current_date_epoch=$(date +%s)
		if [ ${current_date_epoch} -lt ${disable_until_date_epoch} ]; then {
			# If we're here then the disable_until_date_epoch time was greater than the current epoch time which means that the disable policy is still in effect. At this time we exit the script. 
			# I tried to use an exit 1 to exit the script. But that would cause the new shell/terminal to exit. 
			#exit 1
			: # Doing nothing
		} else {
			handle_diffs ${homefile} ${pluginfile}
		}
		fi
	} else {
    # The disable.reminder file did not exist. 
		handle_diffs ${homefile} ${pluginfile}
	}
	fi
  
	} else {
		info "${homefile} ${pluginfile} files were compared and are the same."
	}
	fi
} else {
	# $HOME/.zshrc didn't exist. Copying plugin .vimrc file to ${HOME}
  cp ${pluginfile} ${homefile}
}
fi
