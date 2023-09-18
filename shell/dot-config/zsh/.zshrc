#!/usr/bin/zsh

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
setopt completealiases

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
bindkey -M menuselect '^[[Z' reverse-menu-complete

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# setting for PS1.
autoload -U colors && colors
source /usr/share/git/completion/git-prompt.sh
setopt prompt_subst
PROMPT='%{$fg[red]%}%n%{$reset_color%} on %{$fg[blue]%}%m%{$reset_color%} in %{$fg[cyan]%}ZSH%{$reset_color%} - %{$fg[yellow]%}%1~%{$reset_color%}$(__git_ps1 )
%{$reset_color%}%# '

# set title
case ${TERM} in
  foot*|st*|alacritty*|xterm*|rxvt*)
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    preexec () {print -Pn "\e]0;%n@%m: %~ > $1\a"}
    ;;
  tmux*|screen*)
    precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    preexec () {print -Pn "\e]0;%n@%m: %~ > $1\a"}
    ;;
esac

# set LS_COLOR
# eval $(dircolors --sh)

source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
autopair-init

export FZF_DEFAULT_OPTS="--layout=reverse --height 50%"
export FZF_DEFAULT_COMMAND="fd --type f -H -E '.git'"
export FZF_COMPLETION_TRIGGER='\'
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
