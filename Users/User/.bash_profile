#!/usr/bin/env bash

##########
# This file is meant for login Bash shells (normal Terminal.app sessions on macOS).
# Since we don't want to maintain separate config files, this file will simply
# import .bashrc which will then check if it's read in an interactive shell.
##########

source "$HOME/.bashrc"

# Setting PATH for Python 3.8.
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
