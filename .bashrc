#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -lht'
alias la='ls --color=auto -laht'
alias gf='git checkout $(git rev-list --topo-order HEAD..master | tail -1 | head -1)'
alias gb='git checkout HEAD~'
alias gl='git checkout $(git log --branches -1 --pretty=format:"%H")'
alias gg='git checkout `git rev-list --max-parents=0 HEAD | tail -n 1`'
alias ardtty='stty -F /dev/ttyACM0 cs8 115200 ignbrk -brkint -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke noflsh -ixon -crtscts'
alias gdb='gdb -iex "set auto-load no"'
alias lc='find . -name '*.go' | xargs wc -l | sort -nr'
PS1='[\u@\h \W]\$ '

export EDITOR='nvim'
export GOBIN='/home/hossein/go/bin'
