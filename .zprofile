# Setup SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Setup xinit and i3wm
exec startx

# Set default keyboard mapping as us intl
setxkbmap us -variant intl
