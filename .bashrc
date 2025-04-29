#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -lht'
alias la='ls --color=auto -laht'
alias grep='grep --color'
alias gf='git checkout $(git rev-list --topo-order HEAD..master | tail -1 | head -1)'
alias gb='git checkout HEAD~'
alias gl='git checkout $(git log --branches -1 --pretty=format:"%H")'
alias gg='git checkout `git rev-list --max-parents=0 HEAD | tail -n 1`'
alias gdb='gdb -iex "set auto-load no"'
alias lc='find . -name '*.rs' | xargs wc -l | sort -nr'
alias dvim='NVIM_APPNAME=nvim-dev nvim'
PS1='[\u@\h \W]\$ '

HISTSIZE=10000
HISTFILESIZE=10000

EDITOR='nvim'
PATH="$PATH:$HOME/.cargo/bin"
MANPAGER="nvim +Man!"
