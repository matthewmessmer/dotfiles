#!/bin/zsh

################################################################################
# https://github.com/htr3n/zsh-config/blob/master/lib/completion.zsh
# https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
# https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/completion.zsh
# https://github.com/zimfw/zimfw/blob/master/modules/completion/init.zsh
# https://grml.org/zsh/zsh-lovers.html

# ===== Zsh Options
unsetopt flow_control      # disable start/stop characters in shell editor
unsetopt case_glob         # makes globbing (filename generation) case-sensitive 

setopt menu_complete       # autoselect the first completion entry
setopt always_to_end       # move cursor to the end of a completed word
setopt auto_menu           # show completion menu on a successive tab press
setopt auto_list           # automatically list choices on ambiguous completion
setopt auto_param_slash    # if completed parameter is a directory, add a trailing slash
setopt complete_in_word    # complete from both ends of a word
setopt extended_glob       # needed for file modification glob modifiers with compinit
setopt path_dirs           # perform path search even on command names with slashes
setopt globdots            # files beginning with a . be matched without explicitly specifying the dot
setopt complete_aliases    # don't expand aliases _before_ completion has finished - like: git comm-[tab]

################################################################################
# Completion Module Options
#
# https://grml.org/zsh/zsh-lovers.html#_completion
# Using zstyle: <https://unix.stackexchange.com/a/214699>

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Enable caching to make completion for commands such as dpkg and apt usable
zstyle ':completion::complete:*'    use-cache           yes                             # Enable cache for completions.
zstyle ':completion::complete:*'    cache-path          "$HOME/.zcompcache" # Configure completion cache path.

# Configure matches and grouping in completion menu.
zstyle ':completion:*:*:*:*:*'      menu                select                                      # Enable highlighting in menu.
zstyle ':completion:*:options'      auto-description    '%d'
zstyle ':completion:*:options'      description         yes
zstyle ':completion:*:matches'      group               yes                                         # Separate matches in menu into groups.
zstyle ':completion:*'              group-name          ''                                          # Separate matches in menu into groups.
zstyle ':completion:*'              verbose             yes

# Format group matches in completion menu.
#zstyle ':completion:*:descriptions' format              '%F{yellow}-- %d --%f'  # Comment when using fzf-tab plugin. For more information,
#zstyle ':completion:*:descriptions' format              '[%d]'                  # see https://github.com/Aloxaf/fzf-tab/issues/43.
#zstyle ':completion:*:corrections'  format              '%F{yellow}-- %d (errors: %e) --%f'
#zstyle ':completion:*:messages'     format              '%F{green}-- %d --%f'
zstyle ':completion:*:warnings'     format              '%F{red}-- no matches found --%f'
#zstyle ':completion:*:default'      list-prompt         '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'

# Enable case insensitive completion.
# https://goo.gl/wFKHYw
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' '+r:|?=**'
# https://goo.gl/zuzuP2
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# https://goo.gl/QwQgwN
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Fuzzy match mistyped completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Configure completion of directories.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs no # Disable completion menu of ./ and ../ special directories.

# Ignore unavailable commands
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'

# completion element sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Configure completion of 'kill' command.
zstyle ':completion:*:*:*:*:processes'      command             'ps -u $USER -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes'   list-colors         '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*'             menu                yes select
zstyle ':completion:*:*:kill:*'             force-list          always
zstyle ':completion:*:*:kill:*'             insert-ids          single

# Configure completion of 'man' command.
zstyle ':completion:*:man:*'                menu                yes select
zstyle ':completion:*:manuals'              separate-sections   yes
zstyle ':completion:*:manuals.*'            insert-sections     yes

# history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# ignore multiple entries
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# ssh/scp/rsync
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-host hosts-domain users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
