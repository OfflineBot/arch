#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PATH="$PATH:$HOME/Nim/bin"
export PATH="$PATH:$HOME/.dub/packages/serve-d/0.7.6/serve-d/bin/"
export PATH="$PATH:$HOME/Documents/netman_wrapper/target/debug/"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPROXY=direct

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias nv="nvim"

PS1="\[\033[0;34m\]\w>\[\033[0;37m\] "
