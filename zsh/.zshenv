typeset -U path PATH

path=(
  $HOME/.config/.local/bin                # user scripts
  $HOME/Apps/idea-IU-233.14808.21/bin     # intellij idea bin
  $HOME/.local/share/nvim/mason/bin       # mason installed bins
  $path
)

export PATH
export EDITOR=nvim

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.cache/zsh/history
