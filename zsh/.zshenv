typeset -U path PATH
typeset -U cpp_include CPLUS_INCLUDE_DIRS

path=(
  $HOME/.config/.local/bin                  # user scripts
  $HOME/apps/idea/bin       # intellij idea bin
  $HOME/apps/JetBrains Rider-2024.1.2/bin/  # rider
  $HOME/.local/share/nvim/mason/bin         # mason installed bins
  $path
)

# doesn't work :(
cpp_include=(
  /usr/include/wlroots-0.18/
  $cpp_include
)

export PATH
export EDITOR=nvim

export CPLUS_INCLUDE_DIRS

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.cache/zsh/history

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
