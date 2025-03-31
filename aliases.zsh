# -----------
# |   Git   |
# -----------
alias gs="git status"
alias glo="git log --oneline"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# ----------------
# | Windows Home |
# ----------------
alias winhome="z /mnt/c/Users/Felipe"


# -----------
# |   Eza   |
# -----------
alias ls="eza --color=always -G --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias la="ls -a"


# ----------
# | zoxide |
# ----------
alias cd=z


# ----------
# |  pnpm  |
# ----------
alias pn=pnpm


gbrowse(){
    # Obter o URL remoto
  local repo=$(git config --get remote.origin.url)
  # Verificar se o URL está no formato SSH
  if [[ "$repo" =~ ^git@github\.com: ]]; then
    # Converter o formato SSH para HTTPS
    local https_repo="${repo/git@github.com:/https://github.com/}"
    https_repo="${https_repo/.git/}"
  else
    # Se já estiver no formato HTTPS, apenas usar o URL original
    local https_repo="$repo"
  fi
  
  # Abrir o repositório no navegador
  (explorer.exe "$https_repo" &)
}

gpush() {
  local repo=$(git config --get remote.origin.url)
  
  git add .
  git commit -m "$1"
  git push origin "$repo"
}
