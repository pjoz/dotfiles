# Path to your oh-my-zsh installation.
export ZSH=/Users/pberkman/.oh-my-zsh

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
export NVM_DIR="$HOME/.nvm"

ESLINT="$NVM_DIR/current/lib/node_modules/eslint"

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
nvm use 6.11.0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.yarn/bin:$PATH"

# RUST
export PATH="$HOME/.cargo/bin:$PATH"

# ANACONDA
export PATH="$HOME/anaconda3/bin:$PATH"

# HOMEDIR BIN
export PATH="$HOME/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/pberkman/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/pberkman/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/pberkman/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/pberkman/.nvm/versions/node/v6.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
