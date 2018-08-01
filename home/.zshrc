# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders
POWERLEVEL9K_MODE='nerdfont-complete'

# NerdFonts Overrides for PowerLevel9k existing icons
#POWERLEVEL9K_HOME_SUB_ICON=$'\u'
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\u'
#POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\u'
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\u2765'
#POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\u'
# Heart prompt at end of left prompt
#POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=$'\u2765'

# Prompts for PowerLevel9k
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir nvm pyenv rbenv vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs aws)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history root_indicator command_execution_time background_jobs custom_convox_rack rbenv pyenv host os_icon)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(docker_machine kubecontext aws host os_icon)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo history brew git bower osx rbenv nvm node npm tmux tmuxinator pyenv web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
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

export DEFAULT_USER=steven
if [ -f ${HOME}/.colors/base16.sh ]; then
  source ${HOME}/.colors/base16.sh
fi

if [ -f ${HOME}/.aliases ]; then
  source ${HOME}/.aliases
fi

if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="${PATH}:/usr/local/heroku/bin"
fi

# Python env
if [[ -d ${HOME}/.pyenv ]] ; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

# NVM
if [[ -d ${HOME}/.nvm ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -f $HOME/.local_rc ]; then
  source ~/.local_rc
fi

if [ -d $HOME/bin/ ]; then
  export PATH="${PATH}:/${HOME}/bin"
fi

if [ -d $HOME/.scripts/ ]; then
  export PATH="${PATH}:/${HOME}/.scripts"
fi
