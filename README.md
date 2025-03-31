# Installation with WSL / Termux


## WSL - Ubuntu
```bash
sudo install apt clang zsh brew build-essentials git xclip
```

## Termux
```bash
pkg install apt clang zsh brew build-essentials git xclip
```

## Change to zsh
```bash
chsh "$(which zsh)"
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


## Create the symlink
```zsh
ln -sf "$(realpath ~/.dotfiles/.gitconfig)" ~/.gitconfig
ln -sf "$(realpath ~/.dotfiles/.zshrc)" ~/.zshrc
mkdir ~/.config
ln -sf "$(realpath ~/.dotfiles/nvim/)" ~/.config/nvim
```

