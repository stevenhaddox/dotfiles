# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
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

#
# Custom powerline functions
#

pl9k_ruby(){
  local verstr=$(asdf current 2>&1 | grep "ruby" | rb -l 'ver=split(" ")[1]; exit 1 if ver=="No"; print(ver)')
  local backgroundColor="%F{red}"
  [[ ! -z $verstr ]] && echo -n "%F{red}%F{white}\uF219  $verstr"
}
POWERLEVEL9K_CUSTOM_RUBY="pl9k_ruby"
POWERLEVEL9K_CUSTOM_RUBY_BACKGROUND="red"

pl9k_python(){
  local verstr=$(asdf current 2>&1 | grep "python" | rb -l 'ver=split(" ")[1]; exit 1 if ver=="No"; print(ver)')
  [[ ! -z $verstr ]] && echo -n "%F{royalblue1}%F{white}\UE73C $verstr"
}
POWERLEVEL9K_CUSTOM_PYTHON="pl9k_python"
POWERLEVEL9K_CUSTOM_PYTHON_BACKGROUND="royalblue1"

pl9k_elixir(){
  local verstr=$(asdf current 2>&1 | grep "elixir" | rb -l 'ver=split(" ")[1]; exit 1 if ver=="No"; print(ver)')
  [[ ! -z $verstr ]] && echo -n "%F{purple}%F{white}${ELIXIR_ICON}$verstr"
}
POWERLEVEL9K_CUSTOM_ELIXIR="pl9k_elixir"
POWERLEVEL9K_CUSTOM_ELIXIR_BACKGROUND="purple"

pl9k_erlang(){
  local verstr=$(asdf current 2>&1 | grep "erlang" | rb -l 'ver=split(" ")[1]; exit 1 if ver=="No"; print(ver)')
  [[ ! -z $verstr ]] && echo -n "%F{maroon}${ERLANG_ICON}$verstr"
}
POWERLEVEL9K_CUSTOM_ERLANG="pl9k_erlang"

pl9k_golang(){
  local verstr=$(asdf current 2>&1 | grep "golang" | rb -l 'ver=split(" ")[1]; exit 1 if ver=="No"; print(ver)')
  [[ ! -z $verstr ]] && echo -n "%F{green}${GO_ICON}$verstr"
}
POWERLEVEL9K_CUSTOM_GOLANG="pl9k_golang"

# Prompts for PowerLevel9k
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host history command_execution_time aws custom_ruby custom_python custom_elixir custom_erlang custom_golang rust_version php_version custom_convox_rack newline status os_icon root_indicator context dir vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status host root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

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
plugins=(sudo history brew git bower osx asdf ruby mix nvm node npm tmux tmuxinator web-search)

# Homebrew zsh completion (do this before sourcing oh-my-zsh.sh)
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

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

if [ -f ${HOME}/.aliases_local ]; then
  source ${HOME}/.aliases_local
fi

# asdf-vm
if [ -f /usr/local/opt/asdf/asdf.sh ]; then
  source /usr/local/opt/asdf/asdf.sh
fi

# Heroku
if [ -d "/usr/local/heroku/bin" ]; then
  export PATH="${PATH}:/usr/local/heroku/bin"
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

#OktaAWSCLI
if [ -f "${HOME}/.okta/bash_functions" ]; then
  . "${HOME}/.okta/bash_functions"
fi

# Remove ruby alias
unalias rb
