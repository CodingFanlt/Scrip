# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh theme
export TERM=xterm-256color

# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

# Plugins

plugins=(
  z
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# disable oh-my-zsh auto update
DISABLE_AUTO_UPDATE="true"

# For Vim Warning
# export LC_ALL=en_US.UTF-8
export EDITOR=vim
# GOPATH
export GOPATH=$HOME/Develop/Go
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

# proxy
alias proxy='export http_proxy="http://127.0.0.1:1080" && export https_proxy="http://127.0.0.1:1080"'
# al
alias al='ls | sed "s:^:`pwd`/:"'
# zshedit | zshload
alias zshedit='code ~/.zshrc'
alias zshload='source ~/.zshrc'