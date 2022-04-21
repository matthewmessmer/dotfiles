#!/bin/zsh
#             _
#     ___ ___| |_ ___ ___
#   _|- _|_ -|   |  _|  _|
#  |_|___|___|_|_|_| |___|
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Paths and Variables
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export dotfiles=$HOME/.dotfiles
export DOTFILES=$dotfiles
export ZSH_CUSTOM=$DOTFILES/Zsh/custom

export EDITOR="nano"
export zshrc="$HOME/.zshrc"

# Your project folder that we can `c [tab]` to
export PROJECTS=~/Sites

# Language fix
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Search Configs (fzf/rg)
export IGNORED_DIRS="{.git,.bzr,.svn,.hg,CVS,node_modules,deps,_build,.backstop,.elixir_ls,.cache}"
export RG_DEFAULT_FLAGS=(--no-ignore-vcs --hidden --follow --max-columns 150)
export RG_DEFAULT_ARGS=($RG_DEFAULT_FLAGS --glob "!**/$IGNORED_DIRS/*")
export FZF_DEFAULT_COMMAND="rg --files $RG_DEFAULT_FLAGS --glob '!**/$IGNORED_DIRS/*'"

# Zsh Settings
plugins=(git lando zsh-syntax-highlighting)
ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load Homebrew
export BREW_COMMAND="/opt/homebrew/bin/brew"
[[ -s "$BREW_COMMAND" ]] && eval "$($BREW_COMMAND shellenv)"

# ASDF Configs
#export ASDF_DIR=/opt/homebrew/opt/asdf/libexec
#[[ -s "$ASDF_DIR/asdf.sh" ]] && source "$ASDF_DIR/asdf.sh"
#fpath=(${ASDF_DIR}/completions $fpath)
#autoload -Uz compinit && compinit

# NVM Configs
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# RVM Configs
#export PATH=$PATH:$HOME/.rvm/bin
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# All of our zsh files
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# Load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# Load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# Initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down