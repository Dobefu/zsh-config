alias ls='ls --color=auto'
alias diff='diff --color'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='rg -L --max-depth=25 --smart-case'

alias sshrc='sshrc -X'

alias lll='lsd -lah | less'
alias ll='lsd -lah'
alias la='lsd -A'
alias l='lsd -F'
alias glog='git log --graph --pretty="format:%C(yellow)%h%Cred%d%Creset %s %C(white) %C(cyan)%an%Creset, %C(green)%ar%Creset"'
alias c='clear && . $HOME/.zshrc'
alias :q='exit'
alias ..='cd ..'
alias .='source'
alias t='tmux'
alias tsess='tmux new-session -A -s remote'
alias cdgit='cd $(git root)'

alias copy='xclip -selection clipboard'
alias vi='nvim'
alias vim='nvim'
alias iv='nvim'
alias v='nvim'
alias gti='git'
alias nvimrc='nvim ~/.config/nvim/init.lua'
alias nvimdiff='git -c "diff.tool=nvimdiff" difftool'

# Edit this file.
alias aliases='vi $HOME/.config/zsh/config/aliases.zsh'
