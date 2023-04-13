# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/opt/anaconda/bin


# Path to your oh-my-zsh installation.
export LANG=en_US.UTF-8
export LANG=zh-CN.UTF-8
export LANGUAGE=zh_CN:en_US
export LC_ALL=C
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"
export ZSH="$HOME/.zsh"


# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

eval "$(mcfly init zsh)" 
eval "$(zoxide init zsh)"

cpv() {                                                                                       rsync -pogbr -hhh --backup-dir="/tmp/rsync-${USERNAME}" -e /dev/null --progress "$@"                  
}                                                                                       
compdef _files cpv                                                                                            
                   

# alias
alias cp="cpv"
alias src="source ~/.zshrc"
# alias scp="rsync"
alias cls="clear"
alias cat="bat --theme="Nord""
alias grep="rg"
alias lll="br -sdph"
alias df="duf"
alias usage="tldr"
alias ..='cd ..'
alias ...='cd ../..'
alias ...='cd ../..'
alias ....='cd ../../..'

function pacman_backup(){
        pacman -Qqen > arch-pkglist
}

source /home/equationzhao/.config/broot/launcher/bash/br

# show some information
# neofetch|lolcat
# cowsay -f tux welcome!|lolcat

### Added by Zinit's installer
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

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit snippet OMZ::plugins/extract

# zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions
# zinit light z-shell/F-Sy-H
# zinit snippet OMZ::plugins/colored-man-pages
zinit snippet OMZ::plugins/command-not-found
zinit snippet OMZ::plugins/safe-paste

# zi load z-shell/zsh-navigation-tools
zi ice from"gh-r" as"program"
zi light junegunn/fzf
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh


source ~/.zsh/plugins/autoenv/autoenv.sh
source ~/.zsh/plugins/incr/incr-0.2.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto --icons -a -s type'
    alias ll='exa -l --color always --icons -a -s type'
    alias l='exa -l --color always --icons -a -s type'
    alias la='exa -l --color always --icons -a -s type'
fi

autoload -Uz vcs_info                                                                                                                              
precmd() { vcs_info }                                                                                                                              
zstyle ':vcs_info:git:*' formats '%b '                                                                                                             
                                       
# setopt PROMPT_SUBST                                                                                           
# PROMPT='%(?.%F{blue}√.%F{red}?%?)%f %F{blue}%n@%m%f %l %B%F{black}%20~%f%b
# %F{red}${vcs_info_msg_0_}%f%B%F{yellow}λ%f%b '                                                                                                   
# RPROMPT='%F{green}%*%f'                                                                                       
                       


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
