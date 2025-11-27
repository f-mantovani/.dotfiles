# ~/.bashrc
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

export AVANTE_OPENROUTER_API_KEY=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

export EDITOR=nvim

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

alias pn=pnpm
alias px=pnpx
alias cd=z
alias j=z
alias sc=sfsu
alias scu='scoop update'
alias venv='source ./.venv/Scripts/activate'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ls='eza --color=always -G --long --no-filesize --icons=always --no-time --no-user --no-permissions -a'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Change directory aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

eval "$(fnm env --use-on-cd --shell bash)"
# eval "$(starship init bash)"
eval "$(zoxide init bash)"
