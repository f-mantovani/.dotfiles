if [[ $(pwd) == /mnt/c/* ]]; then
  cd ~
fi

export BAT_THEME="Nord"
export PATH="$PATH:/opt/nvim"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# zsh-completions
fpath=(/home/hermano/.config/zsh/zsh-completions/src $fpath)

autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu yes select search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose yes

# zoxide, jump to repositories
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# -- FD-FIND --
export FZF_DEFAULT_COMMAND='fdfind --hidden --strip-cwd-prefix --exclude .git --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path(){
    fdfind --hidden --exclude .git "$S1"
}

_fzf_compgen_dir(){
    fdfind --type=d --hidden --exclude .git "$S1"
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


#### Aliases #####
alias ls="eza --color=always --no-git --icons=always"
alias bat="batcat"
alias j=z
alias cd=z
alias pn=pnpm
px () {
  pnpm dlx "$@"
}

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias python="python3"
######


setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt correct_all # autocorrect commands
setopt appendhistory
unsetopt BEEP

##### Bind keys for history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# Mapeia as setas para cima e para baixo
bindkey '^P' up-line-or-beginning-search # Seta para cima
bindkey '^N' down-line-or-beginning-search # Seta para baixo

# sourcing zsh helpers
# zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#

### Forces  Cypress to run without gpu 
export CYPRESS_NO_GPU=1
export LIBGL_ALWAYS_SOFTWARE=1
export ELECTRON_EXTRA_LAUNCH_ARGS="--disable-gpu --disable-software-rasterizer"
###


# fnm
FNM_PATH="/home/hermano/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
	export PATH="$FNM_PATH:$PATH"
	eval "$(fnm env)"
fi

# starship, prompt
eval "$(starship init zsh)"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# opencode
export PATH=/home/hermano/.opencode/bin:$PATH


# Added by Antigravity CLI installer
export PATH="/home/hermano/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/hermano/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
