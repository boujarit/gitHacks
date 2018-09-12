#!/bin/bash 
 
 # Name: show_active_branch.sh
 # Description: Script to show the active branch in the prompt 
 #              at the GIT repository filesystem
 
 function parse_git_branch_prompt 
 {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' 
 }
 
 function setup_prompt()
 {
    local        BLUE="\[\033[0;34m\]"
    local        CYAN="\[\033[0;36m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    local     DEFAULT="\[\033[0m\]"
 	     
    PS1="\u@\h:[\W]$CYAN [\$(parse_git_branch_prompt)] $DEFAULT\$ "
 }
 
 setup_prompt
