# blimmer's oh-my-zsh config

# -------------------------------------------------------------------
# Setup
# -------------------------------------------------------------------
export PATH=/usr/local/sbin:node_modules/.bin:$PATH
export ZSH=$HOME/.oh-my-zsh
source $HOME/.dotfiles/secrets 2>/dev/null

# -------------------------------------------------------------------
# Theme
# -------------------------------------------------------------------
ZSH_THEME="agnoster"
DEFAULT_USER="blimmer"

# -------------------------------------------------------------------
# oh-my-zsh plugins
# -------------------------------------------------------------------
plugins=(osx git gpg-agent rbenv nvm npm tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Aliases - System
# -------------------------------------------------------------------
alias cl='clear'
alias mux='tmuxinator'
alias emacs='/usr/local/Cellar/emacs-plus/25.1/Emacs.app/Contents/MacOS/Emacs -nw'

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

# -------------------------------------------------------------------
# NVM
# -------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
