function tm-serverless --description "Open tmux workspace for eyeson serverless project"
    _tmux_workspace node $HOME/projects/serverless "nvim:nvim ." "claude:claude" "term"
end
