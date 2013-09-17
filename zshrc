# CrBoy's zshrc
# =============

# Terminal type
# -------------
TERM=xterm-256color

# Language
# --------
export LANG=zh_TW.UTF-8
export LC_ALL=zh_TW.UTF-8

# Color
# -----
local NC="%{[0m%}"
local BLACK="\%{[0;30m%}"
local GRAY="\%{[1;30m%}"
local RED="%{[0;31m%}"
local LIGHT_RED="%{[1;31m%}"
local GREEN="%{[0;32m%}"
local LIGHT_GREEN="%{[1;32m%}"
local YELLOW="%{[0;33m%}"
local LIGHT_YELLOW="%{[1;33m%}"
local BLUE="%{[0;34m%}"
local LIGHT_BLUE="%{[1;34m%}"
local PURPLE="%{[0;35m%}"
local LIGHT_PURPLE="%{[1;35m%}"
local CYAN="%{[0;36m%}"
local LIGHT_CYAN="%{[1;36m%}"
local LIGHT_GRAY="%{[0;37m%}"
local WHITE="%{[1;37m%}"

# History
# -------
export HISTFILE=~/.zsh_history
export HISTSIZE=1024
export SAVEHIST=1024
setopt INCAPPENDHISTORY HISTIGNOREDUPS EXTENDED_HISTORY HISTIGNORESPACE AUTOPUSHD PUSHDIGNORE_DUPS BEEP EXTENDEDGLOB NOMATCH NOTIFY

# Key Binding
# -----------
bindkey -e

# Auto Completion
# ---------------
setopt AUTO_LIST
setopt AUTO_MENU
#setopt MENU_COMPLETE
setopt CORRECT

autoload -Uz compinit
compinit

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# Completion Caching
# ------------------
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Completion Options
# ------------------
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
# --------------
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
#zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# Color Setting
# -------------

# Auto Completion Color
# ---------------------
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# ManPage Color Setting
# ---------------------
export GROFF_NO_SGR=yes
export LESS_TERMCAP_mb=$'\E[01;31m'     # Begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'     # Begin bold
export LESS_TERMCAP_me=$'\E[0m'         # End mode
export LESS_TERMCAP_se=$'\E[0m'         # End standout-mode - info box
export LESS_TERMCAP_so=$'\E[0;4;30;42m' # Begin standout-mode
export LESS_TERMCAP_ue=$'\E[0m'         # Begin underline
export LESS_TERMCAP_us=$'\E[01;32m'     # ENd underline

# Group Matches and Describe
# --------------------------
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'


# Extra Setting
# -------------
#Alias
#test -s ~/.myENV/_aliases && . ~/.myENV/_aliases || true
#Export
#test -s ~/.myENV/_export && . ~/.myENV/_export || true
#PATH
#test -s ~/.myENV/_path && . ~/.myENV/_path || true


# Prompt
# ------
function precmd {

	vcs_info

	local TERMWIDTH
	(( TERMWIDTH = ${COLUMNS} - 1 ))

	###
	# Truncate the path if it's too long.

	PR_FILLBAR=""
	PR_PWDLEN=""

	local promptsize=${#${(%):---(%n@%m)----}}
	local pwdsize=${#${(%):-%~}}

	if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
		((PR_PWDLEN=$TERMWIDTH - $promptsize))
	else
		PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
	fi

	###
	# Get APM info.

	#if which ibam > /dev/null; then
	#PR_APM_RESULT=`ibam --percentbattery`
	#elif which apm > /dev/null; then
	#PR_APM_RESULT=`apm`
	#fi
}

setopt extended_glob

function preexec {
	if [[ "$TERM" == "screen" ]]; then
		local CMD=${1[(wr)^(*=*|sudo|-*)]}
		echo -n "\ek$CMD\e\\"
	fi
}

function setprompt {
	###
	# Need this so the prompt will work.

	setopt prompt_subst

	autoload -Uz vcs_info && vcs_info
	zstyle ':vcs_info:*' formats '─%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{1}]%f '
	zstyle ':vcs_info:*' actionformats '%F{1}(%f%s%F{1})%f─%F{1}[%F{2}%b%F{3}|%F{1}%a%F{1}]%f'
	zstyle ':vcs_info:(sv[nk]|bzr):' branchformat '%b%F{1}:%F{3}%r'

	###
	# See if we can use colors.

	autoload colors zsh/terminfo
	if [[ "$terminfo[colors]" -ge 8 ]]; then
		colors
	fi
	for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
		eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
		eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
		(( count = $count + 1 ))
	done
	PR_NO_COLOUR="%{$terminfo[sgr0]%}"

	###
	# See if we can use extended characters to look nicer.

	typeset -A altchar
	set -A altchar ${(s..)terminfo[acsc]}
	PR_SET_CHARSET="%{$terminfo[enacs]%}"
	PR_SHIFT_IN="%{$terminfo[smacs]%}"
	PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
	PR_HBAR=${altchar[q]:--}
	#PR_HBAR=" "
	PR_ULCORNER=${altchar[l]:--}
	PR_LLCORNER=${altchar[m]:--}
	PR_LRCORNER=${altchar[j]:--}
	PR_URCORNER=${altchar[k]:--}

	###
	# Decide if we need to set titlebar text.

	case $TERM in
		xterm*)
			PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
			;;
		screen)
			PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
			;;
		*)
			PR_TITLEBAR=''
			;;
	esac

	###
	# Decide whether to set a screen title
	if [[ "$TERM" == "screen" ]]; then
		PR_STITLE=$'%{\ekzsh\e\\%}'
	else
		PR_STITLE=''
	fi

	###
	# APM detection

	#if which ibam > /dev/null; then
	#PR_APM='$PR_RED${${PR_APM_RESULT[(f)1]}[(w)-2]}%%(${${PR_APM_RESULT[(f)3]}[(w)-1]})$PR_LIGHT_BLUE:'
	#elif which apm > /dev/null; then
	#PR_APM='$PR_RED${PR_APM_RESULT[(w)5,(w)6]/\% /%%}$PR_LIGHT_BLUE:'
	#else
	PR_APM=''
	#fi

	###
	# Finally, the prompt.

	PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT [\
$PR_YELLOW %D{%H:%M}$PR_BLUE $PR_GREEN%(!.%SROOT%s.%n)$PR_GREEN@%m$PR_BLUE ]\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_MAGENTA%$PR_PWDLEN<..<%~%<<$PR_BLUE)${vcs_info_msg_0_}\
$PR_BLUE$PR_SHIFT_IN\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT \
$PR_LIGHT_BLUE%(!.$PR_RED#.$PR_WHITE\$)$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_NO_COLOUR '

	RPROMPT=''

	PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

setprompt

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

export EDITOR=vim

# OS Independent Settings
# -----------------------
function setup_linux {
	alias ls='ls --color=auto'
}

function setup_macos {
	alias ls='ls -G'
}

if [ `uname` = "Linux" ]; then
	setup_linux
elif [ `uname` = "Darwin" ]; then 
	setup_macos
fi 

