HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_IGNORE_DUPS

# Autocreate the ZSH history directory if it doesn't exist.
[ ! -d $(dirname $HISTFILE) ] && mkdir -p $(dirname $HISTFILE)

# Search through history with what was already typed.
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
