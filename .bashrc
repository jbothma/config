#
# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source /usr/share/git/completion/git-prompt.sh

function prompt_cmd {

    EXIT_CODE=$?
    RED="\[\033[1;31m\]"
    YELLOW="\[\e[32;1m\]"
    WHITE="\[\e[37;1m\]"
    PURPLE="\[\e[34;1m\]"
    OFF="\[\e[0m\]"

    if [ $EXIT_CODE -eq 0 ]
    then
        EXIT_PT=""
    else
        EXIT_PT="${WHITE}--->${YELLOW}(${RED}${EXIT_CODE}${YELLOW})${OFF}"
    fi

    BIND="${YELLOW})-(${OFF}"
    USER_PT="${WHITE}\u"
    DATE_PT="${PURPLE}\@ \d"
    CWD_PT="${WHITE}\w"

    PS1="${EXIT_PT}\n${YELLOW}(${USER_PT}${BIND}${DATE_PT}${BIND}${CWD_PT}${YELLOW})${WHITE}:\n\$(__git_ps1) \$${OFF} "
}

PROMPT_COMMAND=prompt_cmd

export GEM_HOME=$HOME/.gem
PATH=$PATH:~/bin:node_modules/.bin:/home/jdb/.gem/ruby/2.6.0/bin:$HOME/.gem/bin


unset SSH_ASKPASS

export EDITOR="emacs -nw"

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

alias oupass="PASSWORD_STORE_DIR=~/.pass/openup pass"
alias jdpass="PASSWORD_STORE_DIR=~/.pass/jd pass"
