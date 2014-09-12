alias dotfiles="cd ~/dotfiles/"

if [[ $IS_LINUX -eq 1 ]]; then
    alias work="tmux attach -t work"
    alias sr="supervisorctl restart"
fi

