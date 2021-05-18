# only start tmux when ~/.tmux.conf exists
if [ -f ~/.tmux.conf ] && command -v tmux >/dev/null 2>&1; then
    # Only attach to a TMUX session when there is already a
    # TMUX session AND ssh is used AND vim is NOT used.
    if [[ ! -n ${TMUX+1} && -n ${SSH_TTY+1} && ! -n ${VIM+1} ]]; then
        tmux new-session -A -s ${USER}
    fi
fi
