# Created by newuser for 5.7.1
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/salif/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

PS1='%B%F{46}%n %F{226}%~ %F{46}%#%f%b '

