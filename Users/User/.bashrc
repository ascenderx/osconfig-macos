#!/usr/bin/env bash

##########
# This file is meant for non-login Bash shells (most terminal windows on the
# desktop).
#
# For more aliases, options, commands, &c., consult your distro's default bashrc file (e.g. /etc/bashrc).
##########

# Import POSIX-shell (sh) configurations, including any $PATH additions.
F="~/.profile"
if [[ -f $F ]]
then
  source $F
fi

# If we're not in an interactive shell, then quit here.
case $- in
  *i*) ;;
  *) return ;;
esac

##########
# Aliases for builtin programs
##########

# Import variables ANSI TTY formatting colors and codes.
F="~/.TermConfig/BashFormat.sh"
if [[ -f $F ]]
then
  source $F
fi

# Query the user for all multiple-file operations.
# This should help prevent accidental deletions (rm).
alias rm="/usr/bin/env rm -i"
alias cp="/usr/bin/env cp -i"
alias mv="/usr/bin/env mv -i"

# Use human-readable file sizes when checking free space, disk lists, etc.
alias df="/usr/bin/env df -h"
alias du="/usr/bin/env du -h"

# Display regex searches in color.
alias grep="/usr/bin/env grep --color"
alias egrep="/usr/bin/env egrep --color"
alias fgrep="/usr/bin/env fgrep --color"

##########
# Aliases for listing directories
# See `ls --help` or `man ls` for more details.
##########

case $(uname -s) in
  *Darwin*)
    COLOR_OPT="-G"
    GROUP_OPT=
    F="~/.TermConfig/LSColorsBSD.sh"
    if [[ -f $F ]]
    then
      source $F
    fi
  ;;
esac

# Display files and folders with suffixes, in multi-column mode, with colors.
alias ls="/usr/bin/env ls -Fx $COLOR_OPT $GROUP_OPT"

##########
# Terminal settings
##########

# Set terminal prompt character based on root status ($ vs #).
if [[ $EUID == 0 ]]
then
  PS1_SYM="#"
  PS1_SYM_COL=$PS1_BY
else
  PS1_SYM="$"`
  PS1_SYM_COL=$PS1_BG
fi

# Set terminal prompt: "user@host pwd $ "
PS1="$PS1_BY\u$PS1_BG@$PS1_BM\h $PS1_BC\W $PS1_SYM_COL$PS1_SYM $PS1_X"
unset PS1_SYM
unset PS1_SYM_COL

# Terminal command: set title on each input line.
PROMPT_COMMAND='THISDIR=$(basename "$PWD"); echo -ne "\x1b]0;$USER@$HOSTNAME:$THISDIR\x07"; unset THISDIR'

# Bash history size settings.
export HISTSIZE=1000
export HISTFILESIZE=2000

# Don't put duplicate lines or lines starting with space in history.
export HISTCONTROL=ignoreboth

# Check the window size after each command, and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file; don't overwrite it.
shopt -s histappend

# Store multi-line command as a single command.
shopt -s cmdhist

# Expand aliases.
shopt -s expand_aliases

# Import bash utils (and, by extension, user scripts)
F="~/.TermConfig/BashUtils.sh"
if [[ -f $F ]]
then
  source $F
fi

# Clean up temporary variables.
unset F
