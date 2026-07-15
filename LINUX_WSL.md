# Install guide for Linux / WSL

## Run the commands to install some basically functionalities

```bash
sudo apt install git build-essentials xclip zsh zoxide fd-find eza bat
```

- To get git delta for better diffing in the terminal you need
  to download it in the folloowing link
  [Context: "https://github.com/dandavison/delta/releases"]
  - Download the latest version

  - Extract the file using the following command:

```bash
sudo dkpg -i git-delta-<version>-amd64.deb
```

## Linux: Wezterm

```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update
sudo apt install wezterm
```

## ZSH

Change the shell to zsh:

```bash
chsh -s ($which zsh)
```

## ZSH Plugins

- Get zsh plugins:
  - I clone those inside /.config/zsh so it's easy to ref it

```bash
git clone https://github.com/zsh-users/zsh-completions.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

## Install NVIM

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage
```

If that opens nvim:

```bash
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64 /opt/nvim/nvim
```

add this line to your .bashrc / .zshrc:

```bash
export PATH=$PATH:/opt/nvim/nvim
```

## Github SSH, .dotfiles and .gitconfig

To generate a SSH key:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

CD into the .ssh folder

```bash
 cat ~/.ssh/id_ed25519.pub | xclip
```

- To connect the ssh key to github you need to create a new key on the settings

- After that you can connect your git to github using the following:

```bash
ssh -T git@github.com
```

- git clone your .dotfiles and syslink what you need

```bash
ln ~/.gitconfig ~/
ln -s /home/hermano/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.zshrc ~/
```

## Copilot.lua on WSL

On windows WSL `:Copilot Auth` doesn't work properly until now.
So you need to do the auth in the windows and them copy the folder to wsl

```bash
cp -r /mnt/c/Users/hermano/AppData/Local/github-copilot ~/.config/
```

## Starship Prompt

For starship installation you can run

```bash
curl -sS https://starship.rs/install.sh | sh
```

## FZF most updated version for ubuntu

For fzf updated version:

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
