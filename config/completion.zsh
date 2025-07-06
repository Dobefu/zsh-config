# Enable completion.
autoload -Uz compinit
compinit

setopt extendedglob

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

# Enable case insensitive matching, but only if there are no case-sensitive matches.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle :compinstall filename '~/.zshrc'

fpath+=($ZSH_DIR/config/completion/)

. $ZSH_DIR/config/completion/pnpm.zsh
. $ZSH_DIR/config/completion/go-web-starter.zsh
. $ZSH_DIR/config/completion/web2paper.zsh
