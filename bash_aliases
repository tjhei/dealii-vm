alias ..='cd ..'

source ~/libs/configuration/enable.sh

export DEAL_II_DIR=~/deal.II/installed
export MPIGDB="xterm -e gdb --args"
export DEAL_II_DIFF="numdiff -a 1e-6 -q -s ' \t\n:'"
export PATH=/home/ubuntu/bin:/home/ubuntu/bin/visit2_8_2.linux-x86_64/bin/:$PATH

case "$TERM" in
"dumb")
    export PS1="> "
    ;;
*)
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\e[31m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
;;
esac

export GIT_PS1_SHOWDIRTYSTATE=1
