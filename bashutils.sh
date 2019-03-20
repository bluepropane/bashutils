#!/bin/bash
# git

gitcontainscommit() {
    if [ 0 -eq $(git merge-base --is-ancestor $1) ]; then echo "true"; else echo "false"; fi
}

alias gs="git status"
# git checkout alias with completion
. ~/.git-completion.bash
alias gco="git checkout"
__git_complete gco _git_checkout
	
gpush() {
  git add .
  git commit -m "$1"
  git push
}

gitmergefrom () {
  CURRENT_BRANCH=`git branch | grep \* | cut -d ' ' -f2`
  gco $1 && git pull
  gco $CURRENT_BRANCH && git merge $1
}
__git_complete gitmergefrom _git_checkout



# python
venv() {
    source venv/bin/activate
}
