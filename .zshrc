# blimmer's oh-my-zsh config

# -------------------------------------------------------------------
# Setup
# -------------------------------------------------------------------
export PATH=node_modules/.bin:$PATH
export ZSH=$HOME/.oh-my-zsh

# -------------------------------------------------------------------
# Theme
# -------------------------------------------------------------------
ZSH_THEME="agnoster"
DEFAULT_USER="blimmer"

# -------------------------------------------------------------------
# oh-my-zsh plugins
# -------------------------------------------------------------------
plugins=(git gpg-agent rbenv nvm npm tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Aliases - System
# -------------------------------------------------------------------
alias cl='clear'
alias ag='ack --ignore-dir=log'

# -------------------------------------------------------------------
# Aliases - Safeguards
# -------------------------------------------------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# -------------------------------------------------------------------
# Aliases - Pretty Lists
# -------------------------------------------------------------------
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# -------------------------------------------------------------------
# Aliases - Ember
# -------------------------------------------------------------------
alias clean-ember='rm -fr node_modules bower_components tmp dist && bower install && npm install'
alias dev-test='ember t -s --launch Chrome'

# -------------------------------------------------------------------
# Aliases - Ruby
# -------------------------------------------------------------------
alias migrate!='bundle exec rake db:migrate db:test:prepare'
