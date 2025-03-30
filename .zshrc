export PATH=$HOME/.local/bin:$PATH
BREW_PATH="/home/linuxbrew/.linuxbrew"
export PATH="$BREW_PATH/bin:$PATH"

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


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# -- FD --
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path(){
    fd --hidden --exclude .git "$S1"
}

_fzf_compgen_dir(){
    fd --type=d --hidden --exclude .git "$S1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
autoload -Uz compinit
compinit
zstyle ':completion:*' menu yes select search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose yes

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-completions fzf)
  if type brew &>/dev/null; then
    FPATH="$BREW_PATH/share/zsh-completions:$FPATH"

    autoload -Uz compinit
    compinit
  fi

source "$BREW_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$BREW_PATH/share/zsh-autosuggestions/zsh-autosuggestions.zsh"


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

alias winhome="z /mnt/c/Users/Felipe"

export BAT_THEME="Nord"

alias ls="eza --color=always -G --long --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd=z
alias pn=pnpm

eval "$(zoxide init zsh)"

eval "$(fnm env --use-on-cd --shell zsh)"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

eval "$(oh-my-posh init zsh --config ~/.pl10k.omp.toml)"

cd 
