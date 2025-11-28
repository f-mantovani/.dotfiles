export BAT_THEME="Nord"

# Carregar fzf apenas quando necessário
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# Carregar zoxide apenas quando necessário
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Carregar fnm apenas quando necessário
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# -- FD --
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path(){
    fd --hidden --exclude .git "$S1"
}

_fzf_compgen_dir(){
    fd --type=d --hidden --exclude .git "$S1"
}

export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
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

source "~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "~/.dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "~/.dotfiles/zsh-completions/zsh-completions.plugin.zsh"
source "~/.dotfiles/.aliases.zsh"

autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu yes select search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose yes

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt correct_all # autocorrect commands
setopt appendhistory
unsetopt BEEP

