#!/bin/zsh

# Eza/ls alias
if [ -x "$(command -v eza)" ]; then
    alias ls="eza -lahF --color-scale --icons --group-directories-first --git"
fi

alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command
