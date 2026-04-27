if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    alias cd="z"
    pyenv init - fish | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


# Local secrets (gitignored)
if test -f $HOME/.config/fish/secrets.fish
    source $HOME/.config/fish/secrets.fish
end

# Android SDK
set --export ANDROID_HOME "$HOME/Android"
set --export PATH $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/build-tools/35.0.0 $PATH

# The next line updates PATH for the Google Cloud SDK.
if test -f "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end
