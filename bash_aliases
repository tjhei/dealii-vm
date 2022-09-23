alias ..='cd ..'

source ~/libs/configuration/enable.sh

export Aspect_DIR=~/aspect/build
export DEAL_II_DIR=~/deal.II/installed
export MPIGDB="xterm -e gdb --args"
export DEAL_II_DIFF="numdiff -a 1e-6 -q -s ' \t\n:'"
export PATH=/home/ubuntu/bin:/home/ubuntu/bin/visit3_3_0.linux-x86_64/bin/:$PATH:/home/ubuntu/bin/qtcreator-4.12.2/bin

case "$TERM" in
"dumb")
    export PS1="> "
    ;;
*)
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\e[31m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
;;
esac

export GIT_PS1_SHOWDIRTYSTATE=1
export OMPI_MCA_btl_base_warn_component_unused=0
