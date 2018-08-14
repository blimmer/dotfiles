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
	branch-manager
	bundler
	git
	gpg-agent
	golang
	history-search-multi-word
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
# Aliases - K8s
# -------------------------------------------------------------------
alias kops='aws-vault kops-admin -- kops'
alias kops-prod='aws-vault exec kops-admin -- kops --state=s3://kops-store.ibops.net --name k8s.ibops.net'
alias kops-stage='aws-vault exec kops-staging -- kops --state=s3://kops-store-staging.ibops.net --name k8s-staging.ibops.net'

# -------------------------------------------------------------------
# Go
# -------------------------------------------------------------------
export GOPATH=$HOME/code/go

# -------------------------------------------------------------------
# Python
# -------------------------------------------------------------------
PYENV_ROOT=$(pyenv root)
PYENV_SHIMS_PATH=$PYENV_ROOT/shims
PYTHON_BIN_PATH=$HOME/.local/bin
PYTHON_PATH=$PYENV_SHIMS_PATH:$PYTHON_BIN_PATH

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
