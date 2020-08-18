#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shahriyars configs

# Vim mode 
#set -o vi

#Exports

#PS1='[\u@\h \W]\$ '
export PS1="[\[$(tput sgr0)\]\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;24m\]@\[$(tput sgr0)\]\[\033[38;5;129m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;49m\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;51m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export HKRC="~/.config/sxhkd/sxhkdrc"
export PATH=$PATH:$HOME/Documents/scripts

#Aliases

## SXHDK stuff
alias hk="sxhkd"
alias hkrc="vim $HKRC"
alias rhk="pkill -USR1 -x sxhkd" 

## Creature comforts
alias ls='ls --color=auto'
alias bashrc="vim ~/.bashrc"
alias rbash="source ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias kwinshortcuts="qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.shortcutNames"
alias sshpi="ssh pi@10.0.0.14"
alias feh="feh -x --scale-down --auto-zoom"
alias du="du -h"
alias n="nnn"

#Functions

function record () {
	ffmpeg -video_size $1x$2 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i hw:0 $3.mkv
}

neofetch 
