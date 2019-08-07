# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  status
  dir
  custom_python
  anaconda
  custom_java
  aws
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  battery
  custom_wifi_signal
  date
  time
)

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"

# VCS icons
POWERLEVEL9K_VCS_GIT_ICON=$'\uf1d2 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
POWERLEVEL9K_VCS_BRANCH_ICON=$''
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='orange'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='darkgreen'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='grey19'

# Custom JavaScript prompt
POWERLEVEL9K_CUSTOM_JAVASCRIPT="echo -n '\ue781' JavaScript"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_JAVASCRIPT_BACKGROUND="yellow"

# Custom Python prompt
POWERLEVEL9K_CUSTOM_PYTHON="echo -n '\uf81f' $(python ~/.get_python_version.py)"
POWERLEVEL9K_CUSTOM_PYTHON_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_PYTHON_BACKGROUND="green"
POWERLEVEL9K_ANACONDA_BACKGROUND="green"

# Custom React prompt
POWERLEVEL9K_CUSTOM_REACTJS="echo -n '\ue7ba' ReactJS"
POWERLEVEL9K_CUSTOM_REACTJS_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_REACTJS_BACKGROUND="purple"

# Custom Java prompt
POWERLEVEL9K_CUSTOM_JAVA="echo -n '\ue738' $(sdk current java | awk '/java/{print $4}')"
POWERLEVEL9K_CUSTOM_JAVA_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_JAVA_BACKGROUND="red"

# Custom Wifi prompt
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{black}'

                [[ $speed -gt 100 ]] && color='%F{black}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}" # removed char not in my PowerLine font
        fi
}

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'
source $ZSH/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="funky-pj"
#ZSH_THEME="robbyrussell"

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
plugins=(git osx vim-interaction mvn)

# User configuration
# LShop OnBoarding
export PATH=$PATH:/Users/$USER/bin 
export PATH=~/bin:$PATH 
export PATH="/usr/local/sbin:$PATH" 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion 
export PATH=./node_modules/.bin:$PATH
ESLINT="$NVM_DIR/current/lib/node_modules/eslint"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# Add RVM to PATH for scripting
RVM_PATH="$HOME/.rvm/bin"

# added by Anaconda2 4.3.0 installer
ANACONDA2_PATH="/Users/pberkman/anaconda2/bin"

# go
GO_PATH="/usr/local/go/bin"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$NVM_DIR/bin:$ESLINT/bin:$HOME/bin:$GO_PATH:$ANACONDA2_PATH:$RVM_PATH:"
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Alias path
source ~/.zsh_aliases
source ~/.private_aliases

#GITHUB API TOKEN
source ~/.homebrew_github_key

#P4 SETTINGS
export P4CONFIG="$HOME/Workspace/ExpWeb/www/expweb/trunk/p4.ini"
export P4EDITOR="vim"

# CUDA Settings
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# zsh notify
zstyle ':notify:*' error-title "Command failed"
zstyle ':notify:*' success-title "Command finished"
zstyle ':notify:*' error-sound "Glass"
zstyle ':notify:*' success-sound "default"

# Virtualenv/VirtualenvWrapper
source /usr/local/bin/virtualenvwrapper.sh

# VAULT TEST AUTH
source ~/.vault_env

# DockRun
dockrun(){
  if [ -n "$3" ]
  then
    local expenv="$3"
  else
    local expenv="dev"
  fi
  echo -e "\033[0m Running Docker Machine\033[1m $1\033[0m in environment\033[1m $expenv\033[0m"
  docker run -e "APP_NAME=$1" -e "EXPEDIA_ENVIRONMENT=$expenv" -e "ACTIVE_VERSION=$(git rev-parse HEAD)" -p 8080:8080 -p 8443:8443 $1:$2
}

# NODE Setup
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 9.11.1

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.yarn/bin:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# ANACONDA
# export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize

# HOMEDIR BIN
export PATH="$HOME/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f $HOME/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . $HOME/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f $HOME/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . $HOME/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pberkman/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pberkman/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pberkman/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pberkman/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

