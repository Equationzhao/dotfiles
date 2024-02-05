export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH="/opt/homebrew/opt/curl/bin:$HOME/.go/current/bin:$GOBIN:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
export GOPROXY=https://proxy.golang.com.cn,direct
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
export GPG_TTY=$(tty)
export GIT_AUTO_FETCH_INTERVAL=1200

alias cls=clear
alias src='source ~/.zshrc'
alias cp="cpv"
alias src="source ~/.zshrc"
alias cat="bat --theme="Nord" -p"
alias grep="rg"
alias df="duf"
alias usage="tldr"
alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias find_text="rg"
alias find_file="fd"
alias lines="tokei"

cpv() {
    rsync -pogbr -hhh --backup-dir="/tmp/rsync-${USERNAME}" -e /dev/null --progress "$@"
}

function unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset ALL_PROXY
}


function copy_to_icloud() {

  icloud_dir=~/Library/Mobile\ Documents/com~apple~CloudDocs

  if [[ ! -d $icloud_dir ]]; then
    mkdir -p $icloud_dir
  fi

  for file in "$@"; do
    if [[ -f $file ]]; then
      cp "$file" "$icloud_dir"
      echo "Copied $file to $icloud_dir"
    else
      echo "File $file not found" >&2
    fi
  done

}


if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

## Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit snippet OMZ::plugins/extract

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit light z-shell/F-Sy-H
zinit snippet OMZ::plugins/colored-man-pages
zinit snippet OMZ::plugins/command-not-found
zinit snippet OMZ::plugins/safe-paste
zinit snippet OMZ::plugins/git-auto-fetch
zinit light z-shell/zsh-navigation-tools
zinit ice from"gh-r" as"program"
zinit snippet OMZ::plugins/golang
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit ice as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atpull"%atclone" src"init.zsh"
zinit light starship/starship
zinit light arzzen/calc.plugin.zsh


export PATH="/opt/homebrew/opt/curl/bin:$PATH"

eval "$(g --init zsh)"

function tree() {
    local target="$1"
    if [[ -z "$target" ]]; then
        target="$PWD"
    fi

    g --tree "$target"
}

eval "$(zoxide init zsh)"

function cd() {
    local target="$1"
    if [[ -z "$target" ]]; then
        target="$HOME"
    fi

    z "$target"

    ls
}

function whereami(){
    curl ip.im
}

function system(){
    cpu_mem=$(ps -A -o %cpu,%mem | awk '{ cpu += $1; mem += $2} END {print "CPU: "cpu"% MEM: "mem"%"}')

    echo "${cpu_mem}"
}


autoload -Uz compinit
compinit
eval "$(thefuck --alias)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
