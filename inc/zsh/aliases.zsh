# Arc
alias ad='arc diff'
alias adp='arc diff --preview'

# Clipboard
if [[ $IS_LINUX -eq 1 ]]; then
    alias clip="nc --send-only localhost 8377"
else
    alias clip="nc localhost 8377"
fi

# Dotfiles
alias dotfiles="cd ~/dotfiles/"

# FASD
alias v='fasd -e vim'

# GIT
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git pull"
alias gp="git push"
alias gst="git status"

alias top_committers='git shortlog -sne'

# Supervisor
alias sr="supervisorctl restart"
alias sst="supervisorctl status"

# Tmux
alias ta='tmux attach -t'
alias tkill='tmux kill-session -t'
alias tls='tmux ls'
alias tn='tmux new -s'

# uDeploy
alias urc='ur cleopatra'

# Utils
alias count='sort | uniq -c | sort -nr'
