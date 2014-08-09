function virtualenv_change() {
    if ! which workon >/dev/null; then
        if [ -e "$PWD/env/bin/activate" ]; then
            source "$PWD/env/bin/activate"
        elif which deactivate &> /dev/null; then
            deactivate
        fi
    fi
}

chpwd_functions=(${chpwd_functions[@]} "virtualenv_change")
