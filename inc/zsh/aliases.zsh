alias dotfiles="cd ~/dotfiles/"

if [[ $IS_LINUX -eq 1 ]]; then
    alias work="tmux attach -t work"
    alias sr="supervisorctl restart"
fi

alias v='fasd -e vim'
alias tkill='tmux kill-session -t'
alias ta='tmux attach -t'
