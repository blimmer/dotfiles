# blimmer's oh-my-zsh config

# -------------------------------------------------------------------
# Setup
# -------------------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/oh-my-zsh-custom
source $HOME/.dotfiles/secrets 2>/dev/null

# -------------------------------------------------------------------
# Theme
# -------------------------------------------------------------------
ZSH_THEME="agnoster" # customized slightly - see custom directory
DEFAULT_USER="blimmer"

# -------------------------------------------------------------------
# oh-my-zsh plugins
# -------------------------------------------------------------------
plugins=(
	asdf
	branch-manager
	bundler
	git
	gpg-agent
	golang
	history-search-multi-word
	jenv
	rbenv
	nvm
	npm
	tmux
	tmuxinator
	zsh-aws-vault
	zsh-iterm-touchbar
)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Aliases - System
# -------------------------------------------------------------------
alias cl='clear'
alias mux='tmuxinator'
alias reload!='source ~/.zshrc'

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
# Aliases - Git
# -------------------------------------------------------------------
alias gcd='cd $(git rev-parse --show-toplevel)'

# -------------------------------------------------------------------
# Aliases - Ember
# -------------------------------------------------------------------
alias dev-test='ember t -s --launch x'

# -------------------------------------------------------------------
# Aliases - Ruby
# -------------------------------------------------------------------
alias migrate!='bundle exec rake db:migrate db:test:prepare'

# -------------------------------------------------------------------
# Go
# -------------------------------------------------------------------
export GOPATH=$HOME/code/go

# -------------------------------------------------------------------
# Path
# -------------------------------------------------------------------
export PATH=/usr/local/sbin:node_modules/.bin:$GOPATH/bin:$HOME/.cargo/bin:$PYTHON_PATH:$PATH

# -------------------------------------------------------------------
# aws-vault
# -------------------------------------------------------------------
export AWS_SESSION_TTL=12h
export AWS_FEDERATION_TOKEN_TTL=12h
export AWS_ASSUME_ROLE_TTL=1h

# -------------------------------------------------------------------
# Untracked
# -------------------------------------------------------------------
