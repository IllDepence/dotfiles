# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tarek/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT="[%n@%m %1~]$ "

bindkey '\e[3~' delete-char
bindkey '^[Od' backward-word  # control-left
bindkey '^[Oc' forward-word   # control-right
bindkey '^R' history-incremental-search-backward

alias ls='ls --color=auto'
alias df='df -h'
alias fucking='sudo'
alias chromium='chromium --enable-webgl --ignore-gpu-blacklist'
alias unzip-jp='UNZIP="-O cp932" unzip -x '
alias nano='vim'
alias edit='vim'
alias emacs='vim'
alias weechat='weechat-curses'
mvcd() {
    mv $1 $2;cd $2
    }

export LS_COLORS='di=1:fi=00:ex=96'
export PATH=$PATH:/home/tarek/.scripts:/home/tarek/.scripts/3rd_party:/home/tarek/.cabal/bin:
