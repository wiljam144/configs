# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wiljam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias v="nvim"
alias :q="exit"

local newline=$'\n'
local parse_special='${newline}[${USER}@${HOST}] [$(date +"%I:%M %p")]${newline}λ ($(print -rD $PWD)) -> '
export PS1="${parse_special}"
setopt promptsubst

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	echo ""
	echo "WL-144 MAINFRAME."
	echo "OPERATING SYSTEM VERSION 2."
	echo "PRODUCT OF WILJAM INDUSTRIES, HOLMES ORBITAL DYNAMICS."
	echo ""
	echo -n "SHOULD A GUI BE LOADED? (Y/N) "
	read answer
	case $answer in
	  y|Y ) startx;;
	  n|N ) echo "";;
	  * ) echo "Invalid input";;
	esac

	setxkbmap -option caps:escape
	setxkbmap -option pl
fi

if [[ -z $TMUX ]]; then
	tmux
	setxkbmap -option caps:escape
	setxkbmap -option pl
fi

export PATH="${PATH}:/home/wiljam/.cargo/bin"

