# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.n ushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.config.shell_integration.osc133 = false

source ~/.dotfiles/.zoxide.nu

alias pn = pnpm
alias px = pnpx
alias cd = z
alias j = z
alias sc = sfsu
alias scu = scoop update
def lsw [] { eza --color=always -G --long --no-filesize --icons=always --no-time --no-user --no-permissions -a }
def ba [file: string] { bat --theme Nord $file }


def gbrowse [] {
    let git_repo = (git config --get remote.origin.url)

    # Changes to HTTPS so it can be opened in the browser
    if $git_repo =~ "git@github.com" {
        let git_repo = $git_repo | str replace "git@" "https://" | str replace ":" "/"
    }

    if $git_repo != "" {
        ^start brave $git_repo
    } else {
        echo "Error: Doesn't have a remote repository."
    }

    return null
}

def gac [message: string] {
    git add .
    git commit -m $message
}

def gpush [message: string] {
    git add .
    git commit -m $message
    let branch = git branch --show-current
    git push origin $branch
}

use ~/.dotfiles/nushell/completions/git-completions.nu *
use ~/.dotfiles/nushell/completions/bat-completions.nu *
use ~/.dotfiles/nushell/completions/docker-completions.nu *
use ~/.dotfiles/nushell/completions/npm-completions.nu *
use ~/.dotfiles/nushell/completions/pnpm-completions.nu *
use ~/.dotfiles/nushell/completions/scoop-completions.nu *
use ~/.dotfiles/nushell/completions/yarn-v4-completions.nu *
use ~/.dotfiles/nushell/completions/eza-completions.nu *

# $env.RIO_CONFIG_HOME = "~/.dotfiles/rio"

fnm env --shell powershell | fnm-nushell | from json | load-env
