export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/git-diff-fancy/"
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export NEOVIDE_MULTIGRID=true
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
source ~/.nvm/nvm.sh
. "$HOME/.cargo/env"
