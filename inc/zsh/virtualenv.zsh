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

function virtualenv_prompt_info(){
  if [[ -n $VIRTUAL_ENV ]]; then
    printf "%s[%s] " "%{${fg[yellow]}%}" ${${VIRTUAL_ENV}:t}
  fi
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
