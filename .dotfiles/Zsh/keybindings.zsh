#!/bin/zsh

# =====  zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up     # up arrow
bindkey "$terminfo[kcud1]" history-substring-search-down   # down arrow

bindkey -M menuselect ' ' accept-and-infer-next-history # Space in search to accept and continue searching
#bindkey -M menuselect '^M' .accept-line # Enter on search to accept and execute command

bindkey '^[^[[D' backward-word                # alt + left arrow
bindkey '^[^[[C' forward-word                 # alt + right arrow
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char