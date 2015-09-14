xmodmap ~/.Xmodmap

eval "$(gpg-agent --daemon)"
export GPG_AGENT_INFO  # the env file does not contain the export statement
