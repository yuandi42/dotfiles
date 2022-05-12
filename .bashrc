# ______           _     
# | ___ \         | |    
# | |_/ / __ _ ___| |__  
# | ___ \/ _` / __| '_ \ 
# | |_/ / (_| \__ \ | | |
# \____/ \__,_|___/_| |_|
#!/usr/bin/bash
# TODO: I actually plan to move all my bash stuff to .config/*/, just to
# leave myself a cleaner ls -la $HOME.
                       
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## This is commented out if using starship prompt.
# PS1='[\u@\h \W]\$ '

export EDITOR='vim'

##############
## my alias ##
##############
alias ls='ls --color=auto'
alias lgot='loginctl | egrep -v "root|SESSION|listed" | awk "{print $1}" | xargs loginctl terminate-session'

# easily get the name of key events.
alias xkeyname='xev | awk -F'\''[ )]+'\'' '\''/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'\'''

# print figlet in doom font.
alias fldoom='figlet -f $HOME/.config/figlet/doom.flf'

# for my .dotfiles management. dfc stands for dotfiles config.
alias dfc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias lzdc='lazygit -g ~/.dotfiles/ -w $HOME'

# for suckless tools
alias slm='rm -i config.h && sudo make clean install && make clean'

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
