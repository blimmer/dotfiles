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
# Go
# -------------------------------------------------------------------
export GOPATH=$HOME/code/go

# -------------------------------------------------------------------
# Homebrew
# -------------------------------------------------------------------
if [[ `uname -m` == 'arm64' ]]; then
  export HOMEBREW_PREFIX=/opt/homebrew
else
	export HOMEBREW_PREFIX=/usr/local
fi

# -------------------------------------------------------------------
# Path
# -------------------------------------------------------------------
export PATH=$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$GOPATH/bin:$HOME/.cargo/bin$PYTHON_PATH:$PATH

# -------------------------------------------------------------------
# oh-my-zsh plugins
# -------------------------------------------------------------------
plugins=(
	asdf
	branch-manager
	bundler
	docker-compose
	git
	github-copilot
	gpg-agent
	golang
	history-search-multi-word
	npm
	terraform
	yarn
	zsh-aws-vault
)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Aliases - System
# -------------------------------------------------------------------
alias cl='clear'
alias reload!='source ~/.zshrc'
alias hex='openssl rand -hex 16'
alias wtfcache='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache;'

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
# Aliases - AWS
# -------------------------------------------------------------------
alias awhoami="aws sts get-caller-identity | jq '.Arn'"

# -------------------------------------------------------------------
# asdf
# -------------------------------------------------------------------
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_available

# -------------------------------------------------------------------
# aws-vault
# -------------------------------------------------------------------
export AWS_SESSION_TOKEN_TTL=12h
export AWS_FEDERATION_TOKEN_TTL=12h

# -------------------------------------------------------------------
# aws-cdk
# -------------------------------------------------------------------
alias clist="yarn cdk list"
alias cdiff="yarn cdk diff"
alias cdep="yarn cdk deploy --require-approval never --progress events"

# -------------------------------------------------------------------
# Node/NPM
# -------------------------------------------------------------------
function pkgversions() {
	npm info $1 versions
}

# -------------------------------------------------------------------
# Python
# -------------------------------------------------------------------
alias venv="source venv/bin/activate"

# -------------------------------------------------------------------
# iTerm
# -------------------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# -------------------------------------------------------------------
# 1Password
# -------------------------------------------------------------------
source ~/.config/op/plugins.sh || true

# -------------------------------------------------------------------
# Untracked
# -------------------------------------------------------------------
