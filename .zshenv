#!/bin/zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin
export VISUAL="gedit"

alias ls='ls --color=auto'
alias tumno='redshift -O 5000'
alias svetlo='redshift -x'
alias untar='tar xvf'
alias makemy='sudo chown -R $USER'
