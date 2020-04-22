#
#===============================================================================
#
#          FILE: myzsh.plugin.zsh
#
#         USAGE: Gets loaded by oh-my-zsh custom plugins section
#
#   DESCRIPTION:  If different (script_dir/.zshrc & ~/.zshrc), offer to open/view differences, backup existing .zshrc and replace plugins/zsh/.zshrc to ~/.zshrc
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
homefile=${HOME}/.zshrc
pluginfile=${script_dir}/.zshrc

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

reload() {
	source ~/.zshrc
}

# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down




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
			case `uname` in
				Darwin)
					echo $(date -v +${disable_notification_days}d +%s) > ${script_dir}/disable.reminder
					echo "# $(date -v +${disable_notification_days}d +%s) = $(date -v +${disable_notification_days}d +%Y-%m-%d)" >> ${script_dir}/disable.reminder
					# commands for OS X go here
				;;
				# Linux)
				# 	# commands for Linux go here
				# ;;
				# FreeBSD)
				# 	# commands for FreeBSD go here
				# ;;
				*)
					echo $(date -d "+${disable_notification_days} days" +%s) > ${script_dir}/disable.reminder
					echo "# $(date -d "+${disable_notification_days} days" +%s) = $(date -d "+${disable_notification_days} days" +%Y-%m-%d)" >> ${script_dir}/disable.reminder

			esac
		}
		fi 
}

# HANDLE .ZSHRC IF/WHEN NECESSARY (if ~/.vimrc exists and $CHECK_MYTMUX exists; -z is true if it does not exist. that's why the ! at the beginning to reverse make it true if it doesn't not exist). 
# The reason for these checks is because:
# 1. The plugins describe how to implement what's inside those plugins. It is natural for "your" various RC files to be custom. 
# 2. Based on #1 it is natural to want to ensure that your system is running the expected configuration. 
# 3. There are sometimes conflicts between what is "expected" when you go through the natural progression of trying new things. 
# a. You could change your ~/.mydotfiles/plugins/<custom-plugin>/.rcfile and then just always rely on the custom-plugin enforcer to always write that changed/updated file to its normal location.
# b. I prefer to make changes, not to my <custom-plugin>/.rcfile, but instead to the normally implemented .rcfile. I like this because:
# I. If I don't like the changes then I can just use my last approved/expected configuration from my <custom-plugin>. I don't need to sit there removing configurations, etc..
# II. If I do like the change then I copy over those changes into my <custom-plugin>/.rcfile and then push that change to git. 
# However, this lifecycle comes with challenges. Namely: Instead of always writing <custom-plugin>/.rc file to its normal location we need to detect when there are differences and then how to handle those differences. 
# Yet, handling changes comes with its own challenges. If you're using a shared repository of <custom-plugin>'s then you may have users that are impacted by the steps taken to handle the lifecycle. 
# For example, if a user uses a plugin that has this lifecycle handling AND the user is also used to sudo, su, create new shells, etc.. then these new shells could be negatively impacted (hang) by a prompt for how to handle the changes.
# This problem is handled by using a unique CHECK environment variable. If it is available then check the file to determine appropriate course of action. 
# Caveats:
# a. Adding/Removing the CHECK variables are done through the .zshrc file. It was designed this way so that the same plugins could be used by many (app users). It isn't defined in the plugin since you'd then need two separate plugins (since you don't want a git pull to constantly overwrite this customization). So the idea is that app users will likely be created by something like Ansible which you simply add a specific step for the users where you want this enabled to update your preference of tracking changes. 
# b. 

# This next line (export ...) should be commented out if you do not want to manage this file and get prompted on how to handle changes between this plugin's managedFile and the file used at runtime by the program.  
# For more information see "Feture: Manging files" in the README.md. 
export CHECK_MYZSHRC=anything
if [ -f ${homefile} ] && [ ! -z ${CHECK_MYZSHRC} ]; then {
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
	if [ -f ${homefile} ]; then {
		backup_file_suffix=$(date +%Y-%m-%d_%H:%M:%S | sed 's/\(\.[0-9][0-9][0-9]\)[0-9]*$/\1/' | sed -E 's/((\s)|(:))/./g')
		info "Backing up ${homefile}  to  ${homefile}.bak.${backup_file_suffix}"
		cp ${homefile} ${homefile}.bak.${backup_file_suffix}
		info "Replacing ${homefile}  with  ${pluginfile}"
		cp ${pluginfile} ${homefile}
	} else {
		# $HOME/.zshrc didn't exist. Copying plugin .zshrc file to ${HOME}
  	cp ${pluginfile} ${homefile} 
	}
	fi
}
fi