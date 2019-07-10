#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;92m\]\u \[\033[01;93m\]\w\[\033[01;92m\] \$ \[\033[0m\]'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin:$HOME/Downloads/fuchsia/.jiri_root/bin:$HOME/.gem/ruby/2.6.0/bin

alias tumno='redshift -O 5000'
alias svetlo='redshift -x'
alias untar='tar xvf'
alias makemy='sudo chown -R $USER'

export VISUAL="gedit"

if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent… "
        eval `ssh-agent | tee ~/.ssh/agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
fi
