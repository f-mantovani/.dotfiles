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
$env.Path = ($env.Path | prepend 'C:\Program Files\Git\usr\bin')
alias codium = start C:\Users\Felipe\scoop\apps\vscodium\current\VSCodium.exe
$env.config.buffer_editor = "nvim"

source ~/.zoxide.nu

source ~/.my-theme.nu

alias pn = pnpm
alias px = pnpx
alias cd = z
def lsw [] { eza --color=always -G --long --no-filesize --icons=always --no-time --no-user --no-permissions -a }

def gbrowse [] {
    let git_repo = git config --get remote.origin.url
    start $git_repo
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

use ~/.config/nushell/completions/git-completions.nu *
use ~/.config/nushell/completions/bat-completions.nu *
use ~/.config/nushell/completions/docker-completions.nu *
use ~/.config/nushell/completions/npm-completions.nu *
use ~/.config/nushell/completions/pnpm-completions.nu *
use ~/.config/nushell/completions/scoop-completions.nu *
use ~/.config/nushell/completions/yarn-v4-completions.nu *
use ~/.config/nushell/completions/eza-completions.nu *
