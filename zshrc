# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tarek/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT="[%n@%m %1~]$ "

alias ls='ls --color=auto'
alias df='df -h'
alias unzip-jp='UNZIP="-O cp932" unzip -x '
alias weechat='weechat-curses'

export LS_COLORS='di=1:fi=00:ex=96'

bindkey '\e[3~' delete-char
bindkey '^[Od' backward-word  # control-left
bindkey '^[Oc' forward-word   # control-right
bindkey '^R' history-incremental-search-backward
