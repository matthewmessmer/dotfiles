#!/bin/zsh
#         _         _
#     ___| |___ ___|_|___
#   _|- _| | . | . | |   |
#  |_|___|_|___|_  |_|_|_|
#              |___|

# Execute code in the background to not affect the current session
(
    # <https://github.com/zimfw/zimfw/blob/master/login_init.zsh>
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    autoload -U zrecompile
    local ZSHCONFIG=~/.dotfiles

    # Compile .zcompdump file, if modified, to increase startup speed. This will
    # be executed during start of login shell and run in background to not affect
    # current sesison. For more information, see
    # https://htr3n.github.io/2018/07/faster-zsh/
    zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
        zrecompile -pq "$zcompdump"
    fi
    # zcompile .zshrc
    zrecompile -pq ${ZDOTDIR:-${HOME}}/.zshrc
    zrecompile -pq ${ZDOTDIR:-${HOME}}/.zprofile
    zrecompile -pq ${ZDOTDIR:-${HOME}}/.zshenv
    # recompile all zsh or sh
    for f in $ZSHCONFIG/**/*.*sh
    do
        zrecompile -pq $f
    done
) &!

#eval "$(rbenv init -)"
