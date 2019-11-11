#
##===============================================================================
##
##          FILE: myfzf.plugin.sh
##
##         USAGE: ./myfzf.plugin.sh
##
##   DESCRIPTION:
##
##       OPTIONS: ---
##  REQUIREMENTS: ---
##          BUGS: ---
##         NOTES: ---
##        AUTHOR: Gregg Stewart (),
##  ORGANIZATION:
##       CREATED: 11/10/2019 00:13:20
##      REVISION:  ---
##===============================================================================
#
FD_OPTIONS="--follow --hidden --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} ||cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

export BAT_PAGER="less -R"

#export FZF_DEFAULT_OPS="--extended"
#export FZF_DEFAULT_COMMAND="fd --type f"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
