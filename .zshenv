export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/git-diff-fancy/"
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export NEOVIDE_MULTIGRID=true
export EDITOR="$HOME/.local/bin/nvim"
export NVM_DIR="$HOME/.nvm"
export SUDO_ASKPASS="/usr/bin/ssh-askpass"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

source ~/.nvm/nvm.sh
. "$HOME/.cargo/env"
