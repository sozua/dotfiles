function _tmux_workspace --description "Create or attach to a tmux workspace"
    set -l session_name $argv[1]
    set -l project_path $argv[2]
    set -l window_specs $argv[3..-1]

    if test -z "$session_name" -o -z "$project_path"
        echo "Usage: _tmux_workspace <session_name> <project_path> [window_specs...]"
        echo "  window_spec format: 'name:command' or 'name' for empty terminal"
        return 1
    end

    # Expand ~ in project path
    set project_path (string replace '~' "$HOME" $project_path)

    # Check if session exists
    if tmux has-session -t "$session_name" 2>/dev/null
        # Session exists, attach to it
        tmux attach-session -t "$session_name"
        return 0
    end

    # Create new session (detached) in project directory
    tmux new-session -d -s "$session_name" -c "$project_path"

    # Set up windows
    set -l first_window 1
    for spec in $window_specs
        # Parse "name:command" or just "name"
        set -l parts (string split ':' $spec)
        set -l win_name $parts[1]
        set -l win_cmd $parts[2]

        if test $first_window -eq 1
            # First window already exists, just rename and run command
            tmux rename-window -t "$session_name:0" "$win_name"
            if test -n "$win_cmd"
                tmux send-keys -t "$session_name:0" "$win_cmd" Enter
            end
            set first_window 0
        else
            # Create new window
            if test -n "$win_cmd"
                tmux new-window -t "$session_name" -n "$win_name" -c "$project_path"
                tmux send-keys -t "$session_name:$win_name" "$win_cmd" Enter
            else
                tmux new-window -t "$session_name" -n "$win_name" -c "$project_path"
            end
        end
    end

    # Select first window and attach
    tmux select-window -t "$session_name:0"
    tmux attach-session -t "$session_name"
end
