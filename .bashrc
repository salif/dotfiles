#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;92m\]\u \[\033[01;93m\]\w\[\033[01;92m\] \$ \[\033[0m\]'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin
alias tumno='redshift -O 5000'
alias svetlo='redshift -x'
alias untar='tar xvf'
export VISUAL="gedit"
