STATIC_SSH_AUTH_SOCK="$HOME/.ssh/ssh-auth-sock"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $STATIC_SSH_AUTH_SOCK ]; then
    ln -sf $SSH_AUTH_SOCK $STATIC_SSH_AUTH_SOCK
fi

