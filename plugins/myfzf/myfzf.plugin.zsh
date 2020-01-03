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
# export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} ||cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
# export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
# export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
# export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
# export BAT_PAGER="less -R"


# Found here: https://github.com/bluz71/dotfiles/blob/master/bashrc
alias f='fzf --ansi --preview "bat --color=always --line-range :500 {}"'
alias fkill='fzf_kill'
alias g='_f() { if [[ $# == 0 ]]; then git status -sb; else git "$@"; fi }; _f'
alias gadd='fzf_git_add'
alias gunadd='fzf_git_unadd'
alias gll='fzf_git_log'
alias glS='fzf_git_log_pickaxe'
alias grl='fzf_git_reflog'
alias gtop='glances --disable-bg'
alias gv='gvim 2> /dev/null'
alias h=history


brew_config() {
    if ! [[ -x $(command -v brew) ]]; then
        echo 'Note: brew is not installed.'
        return
    fi

    export BREW_PREFIX=$(brew --prefix)

    # Bash completions.
    #. $BREW_PREFIX/share/bash-completion/bash_completion

    # 'z' configuration.
    _Z_NO_PROMPT_COMMAND=1
    #. $BREW_PREFIX/etc/profile.d/z.sh

    # Custom Bash completions.
    #for f in ~/dotfiles/bash_completion.d/*; do . $f; done

    # Make 'g' alias to Git work with bash-completion.
    # complete -o default -o nospace -F _git g

    # 'fzf' configuration.
    #. $BREW_PREFIX/opt/fzf/shell/key-bindings.bash
    export FZF_DEFAULT_OPTS='
      --height 75% --multi --reverse
      --bind ctrl-f:page-down,ctrl-b:page-up
      --prompt="❯ "
      --color hl:13,fg+:253,bg+:234,hl+:13
      --color info:11,border:237,prompt:111,pointer:9,marker:8,spinner:10,header:4
    '
    export FZF_DEFAULT_COMMAND='fd --type f --color=never'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
    export FZF_ALT_C_COMMAND='fd --type d . --color=never'
    export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'
    # This is an undocumented environment variable for use by fzf.vim, see:
    # https://github.com/junegunn/fzf.vim/pull/707
    export FZF_PREVIEW_COMMAND='bat --color=always {}'

    # 'bat' configuration.
    export BAT_CONFIG_PATH="$HOME/dotfiles/bat.conf"
}


#export FZF_DEFAULT_OPS="--extended"
#export FZF_DEFAULT_COMMAND="fd --type f"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
brew_config