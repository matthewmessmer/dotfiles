#!/bin/zsh

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

#-----------------------------------------------------
# Set variables
#
export EDITOR="vim"
export PROJECTS=~/Sites # Project folder for `c [tab]` function

#-----------------------------------------------------
# Load Homebrew
#
export BREW_COMMAND="/opt/homebrew/bin/brew"
[[ -s "$BREW_COMMAND" ]] && eval "$($BREW_COMMAND shellenv)"

#-----------------------------------------------------
# Load Oh-My-Zsh
#
plugins=(git zsh-history-substring-search zsh-syntax-highlighting)
COMPLETION_WAITING_DOTS="true"
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/Zsh/custom
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

#-----------------------------------------------------
# Autoload functions
#
fpath=($DOTFILES/functions $fpath)
autoload -U $DOTFILES/functions/*(:t)

# Add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DOTFILES/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

#-----------------------------------------------------
# Load scripts $DOTFILES/*/*.zsh
#
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# Load the path.zsh files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# Load everything but the path.zsh and completion.zsh files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# Load every completion.zsh after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files

#-----------------------------------------------------
# Other config
#

# ===== ASDF Configs
#export ASDF_DIR=/opt/homebrew/opt/asdf/libexec
#[[ -s "$ASDF_DIR/asdf.sh" ]] && source "$ASDF_DIR/asdf.sh"
#fpath=(${ASDF_DIR}/completions $fpath)
#autoload -Uz compinit && compinit

# ===== NVM Configs
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# ===== RVM Configs
#export PATH=$PATH:$HOME/.rvm/bin
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
