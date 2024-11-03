alias ls='ls --color=auto'
alias diff='diff --color'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='rg -L --max-depth=25 --smart-case'

alias sshrc='sshrc -X'

alias sshconnor='sshrc root@176.9.7.113'
alias sshclockpi='sshrc pi@clockpi.local'
alias sshcvbackend='sshrc -i ~/.ssh/keys/root@176.9.7.113 webdev@49.13.127.233'

alias sshpve01='sshrc root@192.168.2.230'
alias sshpve02='sshrc root@192.168.2.231'
alias sshpve03='sshrc root@192.168.2.232'
alias sshkb='sshrc webdev@2a02:a44b:8910:1::101'
alias sshmedia='sshrc webdev@2a02:a44b:8910:1::102'
alias sshjenkins='sshrc webdev@2a02:a44b:8910:1::103'
alias sshvarnish='sshrc webdev@2a02:a44b:8910:1::106'
alias sshcv='sshrc webdev@2a02:a44b:8910:1::107'
alias sshestimate='sshrc webdev@2a02:a44b:8910:1::110'

alias lll='lsd -lah | less'
alias ll='lsd -lah'
alias la='lsd -A'
alias l='lsd -F'
alias glog='git log --graph --pretty="format:%C(yellow)%h%Cred%d%Creset %s %C(white) %C(cyan)%an%Creset, %C(green)%ar%Creset"'
alias fucking='sudo'
alias c='clear && . $HOME/.zshrc'
alias :q='exit'
alias ..='cd ..'
alias .='source'
alias t='tmux'
alias tsess='tmux new-session -A -s remote'
alias cdgit='cd $(git root)'
alias icat="kitty +kitten icat"

alias copy='xclip -selection clipboard'
alias vi='nvim'
alias vim='nvim'
alias iv='nvim'
alias v='nvim'
alias emacs='emacsclient -t'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias mutt='neomutt'
alias hugo='hugo --environment develop'
alias feh='feh --conversion-timeout 1'

alias sshbamboo='sshrc -i ~/.ssh/keys/oneshoe@longfonds-web10.prolocation.net bamboo@util3.office.oneshoe.nl'
alias sshlongfondsacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-web10.prolocation.net oneshoe@longfonds-acc10.prolocation.net'
alias sshlongfondsweb10='sshrc -i ~/.ssh/keys/oneshoe@omring-web10.prolocation.net oneshoe@longfonds-web10.prolocation.net'
alias sshlongfondsweb20='sshrc -i ~/.ssh/keys/oneshoe@omring-web10.prolocation.net oneshoe@longfonds-web20.prolocation.net'
alias sshkoetest='sshrc -i ~/.ssh/keys/webdev@koekompas00.appno.nl cvspronssen@koekompas-t.vaacloud.nl'
alias sshkoeacc='sshrc -i ~/.ssh/keys/webdev@koekompas00.appno.nl cvspronssen@koekompas-a.vaacloud.nl'
alias sshkoeprod='sshrc -i ~/.ssh/keys/webdev@koekompas00.appno.nl cvspronssen@koekompas.nl'
alias sshdhlexpressacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-web10.prolocation.net oneshoe@dhlexpress-acc10.prolocation.net'
alias sshdhlexpressweb10='sshrc -i ~/.ssh/keys/oneshoe@omring-web10.prolocation.net oneshoe@dhlexpress-web10.prolocation.net'
alias sshdhlexpressweb20='sshrc -i ~/.ssh/keys/oneshoe@omring-web10.prolocation.net oneshoe@dhlexpress-web20.prolocation.net'
alias sshnhgacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@nhgarts-a-web10.prolocation.net'
alias sshnhgapiacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@nhgartsapi-a-web10.prolocation.net'
alias sshnhgweb10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@nhgarts-p-web10.prolocation.net'
alias sshnhgweb20='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@nhgarts-p-web20.prolocation.net'
alias sshknovacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net iodigital@knov-a-web10.prolocation.net'
alias sshuuledacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@uu-fd-acc10.prolocation.net'
alias sshuuledweb10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@uu-fd-web10.prolocation.net'
alias sshpodeacc10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@web244.prolocation.net'
alias sshpodeprod10='sshrc -i ~/.ssh/keys/oneshoe@omring-acc10.prolocation.net oneshoe@web245.prolocation.net'
alias sshdivosaweb10='sshrc -i ~/.ssh/keys/oneshoe@longfonds-web10.prolocation.net oneshoe@divosa-prd10.prolocation.net'
alias sshlongfondsaws='sshrc -i ~/.ssh/keys/oneshoe@longfonds-acc10.prolocation.net oneshoe@fs01.longfonds.nl'

alias sshnedaptunnel='ssh azureuser@20.16.151.42 -L 3306:10.161.2.4:3306'

# Edit this file.
alias aliases='vi $HOME/Documents/dotfiles/zsh_config/config/aliases.zsh'
