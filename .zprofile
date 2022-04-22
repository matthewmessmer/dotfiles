#!/bin/zsh
#                     ___ _ _     
#     ___ ___ ___ ___|  _|_| |___ 
#   _|- _| . |  _| . |  _| | | -_|
#  |_|___|  _|_| |___|_| |_|_|___|
#        |_|                      

# ===== Executes commands at login before zshrc.
if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
    export LANGUAGE=en_US.UTF-8
fi

export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

# Eliminates duplicates in *paths
typeset -gU cdpath fpath path

# ===== Paths and Variables
path=(
  /usr/local/{bin,sbin}
  $path
)

# Home-made scripts
export PATH=$PATH:${HOME}/.bin
