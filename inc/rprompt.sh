function _virtual_env() {
    [ $VIRTUAL_ENV ] && echo 'Virtual Env: ('`basename $VIRTUAL_ENV`') '
}

export RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(_virtual_env) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'
