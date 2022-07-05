# --- Aliases ---
alias l="ls -Glisa"
alias ls="ls -G"
alias reload="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/"

# --- Useful options ---
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

# Colors
autoload -Uz colors && colors

# --- Completion ---
# ZSH completion
autoload -Uz compinit
compinit
# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Zsh reverse auto-completion
zmodload zsh/complist
# To get new binaries into PATH
zstyle ':completion:*' rehash true
zstyle ':completion:*' file-sort date
zstyle ':completion:*' menu yes=long select
# Disable prompt disappearing on multi-lines
export COMPLETION_WAITING_DOTS="false"

# --- No beep ---
unsetopt BEEP

# --- Git Status ---
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red  
PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f %# '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
