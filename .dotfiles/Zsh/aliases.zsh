#!/bin/zsh

# Exa/ls alias
if [ -x "$(command -v exa)" ]; then
    alias ls="exa -lahF --color-scale --git"
fi

alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command