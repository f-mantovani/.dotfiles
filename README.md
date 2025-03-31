# Installation with WSL / Termux

## Shell

```bash
sudo apt install zsh git
chsh -s "$(which zsh)"
```

## WSL - Ubuntu

```bash
sudo apt install clang brew build-essential xclip
```

## Termux

```bash
pkg install clang zsh brew build-essentials git xclip
```

## Clone the .dotfiles

```zsh
git clone https://github.com/f-mantovani/.dotfiles.git
```

## Install from Homebrew

```zsh
cd .dotfiles
brew bundle
```

## Add aliases

```zsh
bat >> ~/.dotfiles/.zshrc << EOF
source ~/.dotfiles/aliases.zsh
```

## Create the symlink

```zsh
ln -sf "$(realpath ~/.dotfiles/.gitconfig)" ~/.gitconfig
ln -sf "$(realpath ~/.dotfiles/.zshrc)" ~/.zshrc
mkdir ~/.config
ln -sf "$(realpath ~/.dotfiles/nvim/)" ~/.config/nvim
```

## Install Node and PNPM

```zsh
fnm install 21.2.0
npm i -g pnpm@9.15.0
```

