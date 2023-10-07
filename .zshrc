# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


unsetopt auto_cd
ZSH_DOTENV_PROMPT=false
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"

plugins=(
    git
    dotenv
    zsh-autosuggestions
    nvm
)

source $ZSH/oh-my-zsh.sh

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l1='ls -A1'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias wificonnect='sudo nmcli --ask dev wifi connect'
alias wifilist='nmcli dev wifi list'
alias vim='nvim'
alias vimc='vim ~/.config/'
alias dokcer='docker' # i cant type

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

npmv() {
	npm version $1 --no-git-tag-version;
}

nd() {
	mkdir -p "$1" && \
	cd "$1"
}

# changes dir with fzf
fdir() {
	dir=$(find ${1:-.} -type d | fzf +m);
	cd $dir
}

bg () {
	local imgpath
	imgpath=$(fd . $HOME/bg/ --type f 2> /dev/null | fzf +m --preview="catimg -w$COLUMNS {}") &&
		feh --bg-fill -Z "$imgpath"
}

# fzf checkout branches
fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fzf git diff
fdiff() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# fzf checkout commit
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"


# fshow_preview - git commit browser with previews
fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip -sel clip"
}


# shows which proccess you can kill with fzf
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

# zsh history with fzf
fh() {
	cmd=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
	echo $cmd;
	eval $cmd;
}

tm() {
	selected=$(find ~/work ~/personal ~/personal/learning -maxdepth 1 -mindepth 1 -type d | fzf);
	selected_name=$(basename $selected | tr . _ )

	tmux_running=$(pgrep tmux)

	if [[ -z $selected ]]; then
		return;
	fi

	if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
		tmux new-session -s $selected_name -c $selected
		exit 0;
	fi

	if ! tmux has-session -t=$selected_name 2> /dev/null; then
		tmux new-session -ds $selected_name -c $selected
	fi

	echo $selected_name
	tmux switch-client -t $selected_name
}

tml() {
	session=$(tmux ls -F "#{session_name}" | fzf +m)
	echo $session
	if [[ -z $session ]] then
		return;
		exit 0;
	fi

	tmux switch-client -t $session
}

tmk() {
	session=$(tmux ls -F "#{session_name}" 2>/dev/null | fzf +m) && \
	tmux kill-session -t "$session" && echo "Session $session killed"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
