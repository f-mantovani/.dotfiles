alias cd=z
alias cdw="cd $win"
alias j=z

alias pn=pnpm
alias px="pnpm exec"

function gac(){
  git add .
  git commit -m "$1"
}

function gpush() {
  local repo=$(git branch --show-current)
  gac "$1"
  git push origin $repo
}

