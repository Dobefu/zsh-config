#!/usr/bin/env zsh

# Add directories to the PATH.
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Set the Go environment variables.
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Add fixed NVM version to the PATH. Important: The must be the first entry.
export PATH="$HOME/.nvm/versions/node/v18.14.0/bin:$PATH"

# Remove all special characters from the word chars
export WORDCHARS=""

# Set language variables.
export EDITOR="nvim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

export TERMINFO=/usr/lib/terminfo

# Only enable fancy var_dumps on CLI.
export XDEBUG_MODE=develop

# Set the Pico SDK path.
export PICO_SDK_PATH="$HOME/pico-sdk"

# Prevent GnuPG from throwing away KeyIDs.
export PASSWORD_STORE_GPG_OPTS='--no-throw-keyids'

# Prevent Storybook from opening the browser.
export BROWSER=none


# Load NVM
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVM_DIR
# shellcheck source=/dev/null
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[[ -r $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion

nvm() {
  unset -f nvm
  export NVM_PREFIX=$(brew --prefix nvm)
  [ -s "$NVM_PREFIX/nvm.sh" ] && . "$NVM_PREFIX/nvm.sh"
  nvm "$@"
}

# Setup PNPM global path
export PNPM_HOME="/Users/dobefu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
