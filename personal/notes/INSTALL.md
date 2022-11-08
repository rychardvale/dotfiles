# This is a linux migration guide

## Install zsh and oh-my-zsh

-  Fedora
```shell
sudo dnf install zsh &&
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
-  Ubuntu
```bash
sudo apt-get install zsh curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

- Coloca como default zsh
```shell
chsh -s $(which zsh)
```

## Setup ssh
```bash
ssh-keygen -t ed25519
```
Apos feito key
```bash
cat .ssh/ed_25519.pub
```
Copia a paradinha e cola no github

## Git dotfiles repo
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:rychardvale/.dotfiles.git $HOME/.dotfiles
dotfiles checkout -f
```

> Se acontecer erro de untracked, move tudo pra .dotfiles-backup e roda checkout dnv
```bash
mkdir -p .dotfiles-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
---

## Install JetBrains Font
[Nerd fonts](https://www.nerdfonts.com/font-downloads)
```bash
mkdir -p ~/.fonts 
```
unzip fonts e move para ~/.fonts

## Install kitty

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
Apos instalado, move os binarios para usr bin
```bash
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/
```
---
## Install nvm, cargo, go
#### NVM
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
```
Reinicia zsh e instala versao LTS
```bash 
nvm install --lts
```
#### Cargo
```bash
curl https://sh.rustup.rs -sSf | sh
```
installa tree-sitter-cli
```bash
cargo install tree-sitter-cli
```
## Install Neovim
[Neovim repo](https://github.com/neovim/neovim/releases/nightly)

#### Install packer
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

#### Install build-essentials
```bash
sudo dnf install make automake gcc gcc-c++ kernel-devel #fedora
sudo apt-get install build-essentials # ubuntu
```

#### Install ripgrep for telescope
```bash
sudo dnf install ripgrep
```

## Ricing

#### Install stuff
```bash
sudo dnf install polybar rofi xset xrandr feh
```
