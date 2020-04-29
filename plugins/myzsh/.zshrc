# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# GJS: Removed agnoster from random candidates.  found myself not clearly realizing that I was not in my HOME dir. I like how fino puts the pwd in bright yellow and at the end of the system name. 
# GJS: Removed robbyrussell from random candidates. I miss having the hostname, i saw a color change in the prompt from red to green arrow (THOUGH THIS IS THE STATUS OF THE LAST RC WHICH I JUST REALIZED I LIKED), and because I don't feel like it clearly distinguishes where previous commands ended.
# GJS: TOPIC: ZLE mode: I currently do not have EDITOR or VISUAL set and using escape to navigate for loop lines doesn't put me into command mode. Then again I do have my escape key in VI changed to something else (jk). Not a joke...lol.

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.

# GJS: I LIKE MIRA FOR WHAT APPEARS TO BE THE RETURN CODE IN RED ON THE RIGHT.
#ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "strug" "mira" "fino" "xiong-chiamiov" )
# Strug cut for not having time. 
ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "mira" "fino" "xiong-chiamiov" )
# fino cut for not having time. 
ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "mira" "xiong-chiamiov" )
# agnoster cut for not having time. 
ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "mira" "xiong-chiamiov" )
# mira cut for not having time. 
ZSH_THEME_RANDOM_CANDIDATES=( "xiong-chiamiov" )
# liking agnoster more now that I'm doing more with git. interested in checkout out https://github.com/romkatv/powerlevel10k - for its ability to show how many commits ahead/behind it is, # of untracked and unstaged changes. 
ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# GJS: Uncommented so that when I rename iTerm2 tab session titles it doesn't automatically get reset. 
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${HOME}/.mydotfiles

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  myzsh
  ansible
  git
  vundle
  myvim
  docker
  nolioos
  mybin
  mygit
  pyenv
  mytmux
  mycargo
  myfzf
  myansible
  support
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# GJS: I have a feeling it will matter later. But for now I'm adding this towards the top of this file: bindkey -v
  # I just set this bindkey above ZSH_THEME. Was right after it prior to this. It had worked okay. But i have to continually press esc key. boring...
bindkey -v
bindkey -s jk \\e
#
#Easier, more vim-like editor opening
#bindkey -M vicmd v edit-command-line

# Enable ESC v                                                                                                                          │2.
autoload -U edit-command-line                                                                                                           │/tmp/tmux-1004/default:admin:
zle -N edit-command-line                                                                                                                │1
bindkey -M vicmd v edit-command-line

# Commenting this since jk combo seems to work pretty good.
#export KEYTIMEOUT=2

# GJS: Adding this to see if it will restore my ability to search through previous commands based on parts of the command I've written. This was broken when I starting using bindkey -v
bindkey '^j' up-line-or-beginning-search # Down
bindkey '^k' down-line-or-beginning-search # Down

#TRAPWINCH() {
#  zle && { zle reset-prompt; zle -R }
#}

#function zle-line-init zle-keymap-select {
    ##VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    #VIM_PROMPT="NORMAL"
    ##RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    ##RPS1="${${KEYMAP/main|viins/$VIM_PROMPT}/(vicmd)/} $(git_custom_status) $EPS1"
    ##RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    #zle reset-prompt
#}

# Added (on MAC) to resolve errors while trying to run against windows systems using ntlm or kerberos:
# <lvntest000506.bpc.broadcom.net> ESTABLISH WINRM CONNECTION FOR USER: administrator on PORT 5985 TO lvntest000506.bpc.broadcom.net
# objc[99547]: +[__NSPlaceholderDate initialize] may have been in progress in another thread when fork() was called.
# objc[99547]: +[__NSPlaceholderDate initialize] may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(pyenv virtualenv-init -)"
