# Install guide for Linux / WSL

Run the commands to install git, build-essentials,

```bash
sudo apt install git build-essentials xclip zsh fzf zoxide fd-find eza bat
```

- To get git delta for better diffing in the terminal you need
  to download it in the folloowing link
  [Context: "https://github.com/dandavison/delta/releases"]

- Download the latest version

- Extract the file using the following command:

```bash
sudo dkpg -i git-delta-<version>-amd64.deb
```

Install NVIM

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
```

On WSL if you're using Copilot you'll need to copy the auth folder from
windows itself instead of auth on WSL:

```bash
cp -r ~/.config/nvim/auth ~/.config/nvim/auth
```

On windows WSL :Copilot Auth doesn't work properly until now.
So you need to do the auth in the windows and them copy the folder to wsl

```bash
cp -r /mnt/c/Users/hermano/AppData/Local/github-copilot ~/.config/
```
