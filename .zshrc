# blimmer's oh-my-zsh config

# -------------------------------------------------------------------
# Setup
# -------------------------------------------------------------------
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
plugins=(
	branch-manager
	bundler
	git
	gpg-agent
	golang
	rbenv
	nvm
	npm
	tmux
	tmuxinator
	yarn
	zsh-autosuggestions
	zsh-iterm-touchbar
)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Aliases - System
# -------------------------------------------------------------------
alias cl='clear'
alias mux='tmuxinator'

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
# Path
# -------------------------------------------------------------------
export PATH=/usr/local/sbin:node_modules/.bin:$GOPATH/bin:$PATH


# -------------------------------------------------------------------
# Untracked
# -------------------------------------------------------------------
