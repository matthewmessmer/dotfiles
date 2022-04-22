#!/bin/zsh

# ===== Colors
#export LSCOLORS="exfxcxdxbxegedabagacad"
#export LS_COLORS="*.lock=35;44:$LS_COLORS"
#export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export CLICOLOR=true

# ===== Basics
setopt NO_BEEP         #turn off bell
setopt NO_LIST_BEEP
set bell-style none

# ===== Changing Directories
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack
setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory

#setopt NO_BG_NICE # don't nice background tasks
#setopt NO_HUP # 
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt IGNORE_EOF

# ===== Correction
unsetopt CORRECT     # spelling correction for commands
unsetopt CORRECT_ALL # spelling correction for arguments

# ===== Prompt
setopt prompt_subst      # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt # only show the rprompt on the current prompt