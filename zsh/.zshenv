typeset -U path PATH

path=(
  $HOME/.config/.local/bin                  # user scripts
  $HOME/Apps/idea-IU-233.14808.21/bin       # intellij idea bin
  $HOME/Apps/JetBrains Rider-2024.1.2/bin/  # rider
  $HOME/.local/share/nvim/mason/bin         # mason installed bins
  $path
)

export PATH
export EDITOR=nvim

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.cache/zsh/history

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
