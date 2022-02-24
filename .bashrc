#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## This is commented out if using starship prompt.
# PS1='[\u@\h \W]\$ '

export EDITOR='vim'

##############
## my alias ##
##############
alias ls='ls --color=auto'
alias vfr='sh ~/.config/vifm/scripts/vifmrun'
alias hx=helix

# easily get the name of key events
alias xkeyname='xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\'''

# for my .dotfiles management. dfc stands for dotfiles config.
alias dfc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias lzdc='lazygit -g ~/.dotfiles/ -w $HOME'

# for my onedrive synchronization.
alias odupd='onedrive --synchronize --single-directory "Documents"'
##############
## my alias ##
##############

## set keybindings to vi mode.
set -o vi

## enable starship prompt ##
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"
