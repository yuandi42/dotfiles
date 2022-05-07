#!/usr/bin/zsh

source "$HOME/.config/shell/aliasrc"
setopt completealiases

autoload -U compinit
compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%} on %{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "

case ${TERM} in
  st*|alacritty*|xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
  tmux*|screen*)
    ;;
esac
