#!/bin/zsh
#             _
#     ___ ___| |_ ___ ___
#   _|- _|_ -|   |  _|  _|
#  |_|___|___|_|_|_| |___|
#

# for profiling zsh
# https://unix.stackexchange.com/a/329719/27109
#
#zmodload zsh/zprof

export DOTFILES=${ZDOTDIR:-$HOME}/.dotfiles

ZSH_INIT=$DOTFILES/Zsh/_init.sh

if [[ -s ${ZSH_INIT} ]]; then
    source ${ZSH_INIT}
else
    echo "Could not find the init script ${ZSH_INIT}"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# ===== Autoload completion functions.
# https://gist.github.com/ctechols/ca1035271ad134841284
# https://carlosbecker.com/posts/speeding-up-zsh
#
#   -U : Mark the fucntion for autoloading and suppress alias expansion.
#   -z : Use Zsh instead of Korn shell style functions.
autoload -Uz compinit

case $SYSTEM in
  Darwin)
    if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
      compinit;
    else
      compinit -C;
    fi
    ;;
  Linux)
    # not yet match GNU & BSD stat
  ;;
esac

# ===== Local/private scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

#compdef _c c