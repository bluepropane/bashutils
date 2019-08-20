#!/bin/bash
ROOT_DIR=~/bashutils
# utils for this util

# MISC

alias ip="ipconfig getifaddr en0"
# Above is for mac only. More general method is: 
# alias ip="ifconfig en0| sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
# https://stackoverflow.com/questions/13322485/how-to-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x

# =========== git ==========
# git details
gd() {
  git status 1>/dev/null 2>/dev/null
  if [ "$?" != "0" ]; then
    echo "Not a Git repo."
    return 1
  fi
  echo "Git repo remote URL: `git config --get remote.origin.url`"
  cat "`git rev-parse --show-toplevel`/.git/config"
}

gitcontainscommit() {
    if [ "0" -eq "$(git merge-base --is-ancestor $1)" ]; then echo "true"; else echo "false"; fi
}

alias gp="git push"
alias gr="git reset"
alias gl="git log --pretty=oneline"
alias gs="git status"
alias gs+="git stash push"
alias gs-="git stash pop"
alias gsl="git stash list"

# git checkout alias with completion
source ${ROOT_DIR}/git-completion.bash
alias gco="git checkout"
__git_complete gco _git_checkout
	
gpush() {
  git add .
  git commit -m "$1"
  git push
}

gitmergehead () {
  if [ "$1" != "" ]; then
    CURRENT_BRANCH=`git branch | grep \* | cut -d ' ' -f2`
    gco $1 && git pull
    gco $CURRENT_BRANCH && git merge $1
  else
    echo "Please specify a target branch to merge from."
    echo "gitmergefrom <target_branch_name>"
  fi
}
__git_complete gitmergefrom _git_checkout



# python
venv() {
    source venv/bin/activate
}
