# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

complete -cf sudo

# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
# (This is no longer needed from version 0.8 of the theme engine)
# export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# Set TERM to use more color
#export TERM=xterm-color
#export TERM=screen

#PS1="\u:\w \!>"
PS1="\e[32m\w\n\u@\h \!> \e[0m"
umask 022

# Set path
PATH=.:~/bin:/sbin:/usr/sbin/:/usr/local/sbin:$PATH
PATH=$PATH:/usr/local/modelsim6.1e/modeltech/bin

# Some more alias to avoid making mistakes:
alias ls="ls --color=always"
alias l="ls -alF"
alias h="history"
alias vi="vim"
alias gvi="gvim --remote-tab-silent"
alias sb="source ~/.bashrc"
alias vb="vi ~/.bashrc"
alias home="cd /cygdrive/c/home"
alias to-test="cd /cygdrive/c/home/test"

# Set Emacs
PATH=$PATH:/opt/editors/emacs23/bin
export PATH
#alias emacs23='/opt/editors/emacs23/bin/emacs --enable-font-backend -fn "Consolas-11"'
alias emacs23='/opt/editors/emacs23/bin/emacs --enable-font-backend'

# Set ipython
export PYTHONPATH=.:/usr/local/lib/python2.6/site-packages:$PYTHONPATH
alias ipy='ipython'
alias pysh='ipython -p pysh'

# Set dmd D compiler
#export PATH=$PATH:/opt/dmd/bin
#export LIBRARY_PATH=$LIBRARY_PATH:/opt/dmd/lib

# Set screen (compiled with --enable-colors256)
export PATH=/opt/screen/bin:$PATH

