# User configuration
export EDITOR=vim
export PAGER=less

# Alias definiton
alias la="ls -aFG"
alias lf="ls -FAG"
alias ll="ls -lAFG"

alias svim="sudo -E vim"
alias vi="vim"

# autocompletion settings
autoload -Uz compinit
compinit

zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' special-dirs true

# prompt setting
autoload -Uz compinit promptinit
promptinit

# set prompt theme
prompt redhat

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups        # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history           # share command history data

# misc options
setopt   nomatch
setopt   notify
unsetopt autocd
unsetopt beep
unsetopt extendedglob

# terminal application settings
export TERM=xterm-256color
export MC_SKIN=~/.mc/solarized.ini
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxaeafabagacad

# Language and
export LC_CTYPE=de_DE.UTF-8
export LC_TIME=de_DE.UTF-8
export LC_NUMERIC=de_DE.UTF-8
export LC_MONETARY=de_DE.UTF-8
export LC_MESSAGES=C
export LC_COLLATE=C

# vi keybindings
bindkey -v

bindkey "^[[1~"  beginning-of-line                  # Home key
bindkey "^[[4~"  end-of-line                        # End key
bindkey "^[[2~"  overwrite-mode                     # Insert key
bindkey "^?"     backward-delete-char               # Backspace
bindkey "^[[3~"  delete-char                        # Delete key
bindkey "^[[A"   history-beginning-search-backward  # Up key
bindkey "^[[B"   history-beginning-search-forward   # Down Key
bindkey "^[[D"   backward-char                      # Left Key
bindkey "^[[C"   forward-char                       # Right Key

bindkey "^A"    beginning-of-line                   # Ctrl+A
bindkey "^B"    backward-char
bindkey "^D"    delete-char-or-list
bindkey "^E"    end-of-line                         # Ctrl+E
bindkey "^F"    forward-char
bindkey "^G"    list-expand
bindkey "^H"    vi-backward-delete-char
bindkey "^I"    expand-or-complete
bindkey "^J"    accept-line
bindkey "^K"    vi-kill-line
bindkey "^L"    clear-screen
bindkey "^M"    accept-line
bindkey "^N"    down-line-or-history
bindkey "^O"    accept-line-and-down-history
bindkey "^P"    up-line-or-history
bindkey "^Q"    vi-quoted-insert
bindkey "^R"    history-incremental-search-backward
bindkey "^S"    history-incremental-search-forward
bindkey "^T"    transpose-chars
bindkey "^U"    kill-whole-line
bindkey "^V"    vi-quoted-insert
bindkey "^W"    vi-backward-kill-word

# numpad keys
bindkey -s "^[Ol" "+"
bindkey -s "^[OS" "-"
bindkey -s "^[OR" "*"
bindkey -s "^[OQ" "/"
bindkey -s "^[OM" "^M"

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# color in less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

# Only attach to a TMUX session when, there is already a
# TMUX session AND ssh is used AND  VIM is not used.
if [[ ! -n ${TMUX+1} && -n ${SSH_TTY+1} && ! -n ${VIM+1} ]]; then
    tmux new-session -A -s ${USER}
fi
