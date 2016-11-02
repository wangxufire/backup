# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="Honukai"
ZSH_THEME="ys2"

alias ccm='echo 6216610800007657191'
alias cl='clear'
alias vi='vim'
alias docker='sudo docker'
alias ll='ls -l'
alias la='ls -a'
alias pip='pip3'
alias python='python3'
alias grep='grep --color=auto'
alias ssv='ssh root@45.62.97.65 -p 29721'
alias cos='feh -zZF -D 2 /Users/madoka/Pictures/OneDrive/cos/倉坂\ くるる/*'
alias lr='feh -zZF -D 2 /Users/madoka/Pictures/OneDrive/cos/LiRong/*'
alias lkk='feh -zZF -D 2 /Users/madoka/Pictures/OneDrive/cos/洛可可/*'
alias misa='feh -zZF -D 2 /Users/madoka/Pictures/OneDrive/cos/习呆呆/*'
alias gitstar='starred --username wangxufire --repository awesome-stars --sort --token 088fad1aa5bbc4b7aa87afcc5a418a1ef1595460'
alias updhosts="wget https://raw.githubusercontent.com/racaljk/hosts/master/hosts -qO /tmp/hosts && sudo sh -c 'cat /tmp/hosts > /etc/hosts'"

# working
alias lna='ln -s /Users/madoka/Workspace/dnet/dpos/dpos-auth-web/src/main/ext/* /Users/madoka/Workspace/dnet/dpos/dpos-auth-web/target/dpos-auth-web'
alias lnw='n -s /Users/madoka/Workspace/dnet/dpos/dpos-web/src/main/ext/* /Users/madoka/Workspace/dnet/dpos/dpos-web/target/dpos-web'
alias saw='sencha app watch'
alias sar='sencha app refresh'
alias ssm='ssh madoka@172.17.2.71'
alias sse1='ssh root@121.42.158.68'
alias sse2='ssh root@114.215.84.21'
alias ss242='ssh root@172.17.6.242'
alias ss127='ssh root@172.17.7.127'
alias ssj='ssh root@172.17.6.3'

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
ENABLE_CORRECTION="true"

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
plugins=(git osx mvn gradle last-working-dir catimg wd zsh-syntax-highlighting brew-cask brew sudo golang pip npm web-search python node go gulp spring torrent themes xcode cp svn colorize docker docker-compose zsh-navigation-tools)

# User configuration
source ~/.profile
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /Users/madoka/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

