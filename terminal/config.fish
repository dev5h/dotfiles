if status is-interactive
    # Commands to run in interactive sessions can go here
	set -x PATH ~/.local/bin/ $PATH

end

# Automatically start tmux if not already running
if not set -q TMUX
    # Check if we're running an interactive shell
    if status is-interactive
        # Create or attach to a session named 'default'
        tmux attach -t default || tmux new -s default
    end
end

# Ensure 'exit' closes the terminal instead of ending the tmux session
function fish_user_key_bindings
    bind \ce 'tmux detach && exit'
end

