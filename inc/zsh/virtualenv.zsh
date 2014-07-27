function virtualenv_change() {
    if [ -e "$PWD/env/bin/activate" ]; then
        source "$PWD/env/bin/activate"
    elif which deactivate &> /dev/null; then
        deactivate
    fi
}

chpwd_functions=(${chpwd_functions[@]} "virtualenv_change")
