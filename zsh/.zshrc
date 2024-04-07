# init
autoload -Uz compinit
compinit

# Basic completion
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zmodload zsh/complist
_comp_options+=(globdots)  # Include hidden files


# Menu vim key binds
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Prompt
autoload -Uz vcs_info
zstyle ':vsc_info:git:*' formats 'on %b '
setopt prompt_subst
PROMPT='%F{#E4BF7B}%B%n%b%f %F{#ffffff}%B%~%b%f %F{#8bde5e}%B${vcs_info_msg_0_}%b%f%F{#DE6B74}%B%(!.#.$)%b%f '
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

# NNN cd on quit
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

# Alias
alias ls='ls --color=auto'
