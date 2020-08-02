#!/usr/bin/env sh

##########
# This is intended for POSIX/Bourne shells (sh) as well for Bash shells.
##########

# Set file mode creation mask.
# Each set bit is an unset flag for each new file.
umask 022

# Set $PATH so that it includes the user's private binaries if the directory
# exists.
if [ -d "$HOME/bin" ]
then
  export PATH="$PATH:$HOME/bin"
fi

# Uncomment this to ensure security programs are accessible to root.
#export PATH="$PATH:/usr/sbin:/usr/local/sbin"
