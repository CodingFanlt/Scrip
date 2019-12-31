# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh theme
export TERM=xterm-256color

ZSH_THEME="ys"

# Plugins

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# For Vim Warning
# export LC_ALL=en_US.UTF-8

# GOPATH
# export GOPATH=$HOME/Develop/Go
export GOPROXY=https://goproxy.cn,https://goproxy.io,direct

## MyPath
export PATH="$HOME/Tools/MyPath:$PATH"

## If package manager is brew
if (( ${+commands[brew]} )); then
  ## Disable brew auto update
  export HOMEBREW_NO_AUTO_UPDATE=true
  ## Config node@10 env
  # export PATH="/usr/local/opt/node@10/bin:$PATH"
fi

## If goctl in path env
if ((${+commands[goctl]}));then
  export GOCTL_AUTO_UPDATE=off
fi

# Alias

alias proxy='export http_proxy="http://127.0.0.1:1080" && export https_proxy="http://127.0.0.1:1080"'
alias al='ls | sed "s:^:`pwd`/:"'