#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shahriyars configs

#Exports
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[36m\]\w\[\e[m\] \[\e[35m\]-> \[\e[m\] "
#PS1='[\u@\h \W]\$ '
#export PS1="[\[$(tput sgr0)\]\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;24m\]@\[$(tput sgr0)\]\[\033[38;5;129m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;49m\]\w\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;51m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

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
alias pi="ssh pi@10.0.0.100"
alias feh="feh -x --scale-down --auto-zoom"
alias du="du -h"
alias n="nnn"
alias ltex="latexmk -pdf -pvc"
#Functions

function record () {
	ffmpeg -video_size $1x$2 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i hw:0 $3.mkv
}

#cat /home/shahriyar/.cache/wal/sequences
pfetch

